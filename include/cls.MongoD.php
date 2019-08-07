<?php
/**
 * MongoDB防止预期外注入的措施：
 * ==============================================================================
 * 简单说就是不要给用户传入数组的机会。
 * 1，对于写入的Document, 要提前定义结构，Model在写入时会对“文档内容”进行结构限定
 * 2，对所有$where查询的条件进行type casting限定，具体如下：
 * 
 * Type Casting 
 *     The casts allowed are:
 *     (int), (integer) - cast to integer
 *     (bool), (boolean) - cast to boolean
 *     (float), (double), (real) - cast to float
 *     (string) - cast to string
 *     (array) - cast to array
 *     (object) - cast to object
 *     (unset) - cast to NULL (PHP 5)
 *     
 * 文档子数组使用示例说明:
 * ==============================================================================   
 * 增加子数组项：
 * push是简单加入，addToSet是防重复增加，如果记录集中已经有一个项目了，不会重复增加一次
 * $obj->Update( 
		array('images'=>array( 'src'=>'123', 'local'=>'456' ) ), 
		array( '_id' => $id ,'mongo'=>'push/addToSet' ) 
   );  
	
   删除子数组项：
   $obj->Update(
		array('images'=>array( 'src'=>'aaa' ) ),
		array( '_id' => func_getMongoID("55baadeec09568a0bd0041a7") ,'mongo'=>'pull' )
   );
   
   修改子数组项：
	   直接指定集合修改
	   $status = $obj->Update(
			array('images.2.src'=>'eee' ),
			array( '_id' => func_getMongoID("55baadeec09568a0bd0041a7") )
	   );
	   
	   使用查询条件和$对满足查询的第一个集合进行修改
	   $status = $obj->Update(
			array('images.$.src'=>'node' ),
			array( '_id' => func_getMongoID("55baadeec09568a0bd0041a7"),'images.src'=>'aaa' )
	   );
 *  
 * MongoDB日常维护: 导入导出
 * ==============================================================================
 * mongoexport --host mongodb1.example.net --port 37017 --username user --password pass  --db marketing --collection contacts --out  /opt/backups/mdb1-examplenet.json   
 * mongoimport --host mongodb1.example.net --port 37017 --username user --password pass  --db marketing --collection contacts --file /opt/backups/mdb1-examplenet.json 
 *     
 * @author weiqiwang
 */
class MongoD{
	var $conn;//当前链接
	var $silent = false;//是否不抛出异常信息
	
	var $config=array();//当前链接的配置
	var $sql=array();//累计执行的sql语句
	var $querynum=0;//累计查询的数量
	
	/**
	 * 初始化连接
	 * http://php.net/manual/en/mongoclient.construct.php
	 * $serverString = mongodb://[username:password@]host1[:port1][,host2[:port2:],...]/db
	 * 
	 * @param array $config
	 */
	function init(){
		$authstr = "";
		if(isset($this->config['user'])&&isset($this->config['password'])) $authstr="[{$this->config['user']}:{$this->config['password']}@]";
		
		$serverString = "mongodb://{$authstr}{$this->config['server']}";
		$MongoDbObj = isset($this->config['options'])?new MongoClient( $serverString, $this->config['options'] ):new MongoClient( $serverString );
		$database = $this->config['database'];
		$this->conn = $MongoDbObj->$database;
	}
	
	/**
	 * 具体使用与getAll相同，只是返回一条记录
	 */
	function getOne($fields="*", $where = array(), $table, $order=null){
		$where['limit']=1;
		$result=$this->getAll( $fields, $where, $table, $order, 1);
		if(!empty($result)){
			foreach($result as $rs){
				return $rs;
				break;
			}
		}
	}
	
	/**
	 * 参见文档
	 * http://php.net/manual/en/mongocollection.find.php
	 * http://docs.mongodb.org/manual/reference/method/db.collection.find/
	 * 
	 * // search for fruits
	 * $equalQuery = array('Type' => 'Fruit');
	 * 
	 * // search for produce that is sweet. Taste is a child of Details. 
	 * $childEqualQuery = array('Details.Taste' => 'Sweet');
	 * 
	 * // search for documents where 5 < x < 20
	 * $rangeQuery = array('x' => array( '$gt' => 5, '$lt' => 20 ));
	 * 
	 * // 快速定位查询
	 * $quickQuery = array('$in' => array('Joe', 'Wendy'));
	 * 
	 * // 使用js进行复杂查询定义
	 * $js = "function() {
	 *     return this.name == 'Joe' || this.age == 50;
	 * }";
	 * $complexJsQuery = array('$where' => $js);
	 * 
	 * // 使用内置字段的模糊搜索， 类似SQL的`title` LIKE '%关键字%'
	 * // 参见 http://php.net/manual/en/class.mongoregex.php
	 * // i: 不区分大小写， ^:开始  $: 结束
	 * $where = array(
		  'title' => array(
		    '$all' => array(new MongoRegex('/关键字/i'), new MongoRegex('/^关键字/i'), new MongoRegex('/关键字$/'),...),
		    '$nin' => array(new MongoRegex('/不能出现的/'), ...)
		  )
		)

	 * //其它常用查询语法
	 * 大于等于$gte，小于等于$lte, 不等于$ne，不包括$nin, 是否存在$exists, 全文搜索$text
	 * 
	 * //逻辑操作
	 * $and,$or,$nor,$not
	 * 
	 * //更多查询语法参见 
	 * http://docs.mongodb.org/manual/reference/operator/query/
	 * http://docs.mongodb.org/manual/reference/operator/query-modifier/
	 * 
	 * @param string $fields
	 * @param string $where
	 * @param string $table
	 * @param string $order
	 * @param string $limit
	 * 
	 * @return multitype:array
	 */
	function getAll($fields="*", $where = array(), $table, $order=null, $limit=null){
		$fieldArr=array();
		if(is_array($fields)){
			foreach($fields as $key=>$field) {
				$fieldArr[$field]=true;
			}
		}
		
		//查询条件参见上面的注释，多个条件可以同时存在
		$where = $this->__formatMongoID($where);
		
		//处理排序
		$sort = array();
		if(isset($where['order'])) {
			$order=$where['order'];
			unset($where['order']);
		}
		if(!empty($order)){
			if(is_array($order)){
				foreach($order as $key=>$val){
					if(is_numeric($val)){
						if($val!=1 && $val!=-1) $val=1;
						$sort[$key]=$val;
					}else{
						$val = strtoupper($val);
						$sort[$key]=($val=='ASC')?1:-1;
					}
				}
			}
		}
		
		//处理读取记录数
		$skip=0;$max=50;
		if(isset($where['limit'])) {
			$limit=$where['limit'];
			unset($where['limit']);
		}
		if(is_numeric($limit)) $max=$limit;
		if(is_array($limit)){
			$skip = intval($limit[0]);
			if(isset($limit[1])) $max = intval($limit[1]);
			if($max==0) $max=50;
		}
		
		$result = array();
		if(empty($fieldArr)){
			$cursor = $this->conn->$table->find($where);
		}else{
			$cursor = $this->conn->$table->find($where, $fieldArr);
		}
		
		//记查询日志
		$sql = array(
				'Action'=>'Select',
				'Fields'=>empty($fieldArr)?'All':$fieldArr,
				'Collection'=>$table,
				'where'=>$where,
		);
		if(!empty($sort)) $sql['Sort'] = $sort;
		if($max>1) $sql['Limit'] = array('start'=>$skip,'num'=>$max);
		$this->sql[] = $sql;
		$this->querynum++;
		
		if(!empty($cursor)){
			if(!empty($sort)) $cursor = $cursor->sort($sort);
			if(!empty($skip)) $cursor = $cursor->skip($skip);
			if(!empty($max)) $cursor = $cursor->limit($max);
			
			//将查询结果转换成数组
			$result = iterator_to_array($cursor);
		}
		
		//如果定义了查询字段，过滤_id字段
		if(!empty($fieldArr)){
			if(!isset($fieldArr['_id'])){
				foreach($result as $key=>$val){
					unset($val['_id']);
					$result[$key] = $val;
				}
			}
		}
		
		return $result;
	}
	
	function Insert( $document, $table ){
		$document = $this->__formatMongoID($document);
		if(!isset($document['_id']))$document['_id'] = func_getMongoID();
		
		$result = $this->conn->$table->insert($document);
		
		$this->sql[]=array('Action'=>'Insert','Doc'=>$document);
		$this->querynum++;
		
		return empty($result['ok'])?$result:$document['_id'];
	}
	
	function Replace( $document, $table ){
		$document = $this->__formatMongoID($document);
		if(isset($document['_id'])){
			$id = $document["_id"];
			unset($document["_id"]);
		}else{
			$id = func_getMongoID();
		}
		
		$result = $this->conn->$table->update(array("_id" => $id), array('$set' => $document), array("upsert" => true));
		
		$this->sql[]=array('Action'=>'Replace','Doc'=>$document);
		$this->querynum++;
		
		return empty($result['ok'])?$result:$id;
	}
	
	//更多操作功能参见 http://docs.mongodb.org/manual/reference/operator/update/
	function Update( $document, $where, $table ){
		$document = $this->__formatMongoID($document);
		$where = $this->__formatMongoID($where);
		
		$mongoAction = 'set';//set, push, addToSet, pull
		if(isset($where['mongo'])){
			$mongoAction = $where['mongo'];
			unset($where['mongo']);
		}
		
		//更新选项
		$options = array();
		if(isset($where['upsert'])){//设置没有符合条件的查询时，加入新文档
			$options['upsert']=true;
			unset($where['upsert']);
		}
		if(isset($where['multiple'])){//设置更新所有符合条件的文档
			$options['multiple']=true;
			unset($where['multiple']);
		}
		
		if(!empty($options)){
			$result = $this->conn->$table->update($where, array('$'.$mongoAction =>$document), $options );
		}else{
			$result = $this->conn->$table->update($where, array('$'.$mongoAction =>$document) );
		}
		
		$this->sql[]=array('Action'=>'Update','Where'=>$where,'Doc'=>$document);
		$this->querynum++;
		
		return $result;
	}
	
	function Remove( $where, $table ){
		$where = $this->__formatMongoID($where);
		$Options = array();
		if(!empty($where['justOne'])){
			unset($where['justOne']);
			$Options = array("justOne" => true);
			$result = $this->conn->$table->remove( $where, $Options);
		}else{
			$result = $this->conn->$table->remove( $where );
		}
		
		$this->sql[]=array('Action'=>'Remove','Where'=>$where,'Options'=>$Options);
		$this->querynum++;
		
		return $result;
	}
	
	function Count( $where=array(), $table ){
		$where = $this->__formatMongoID($where);
		if(isset($where['order'])) unset($where['order']);
		$result = $this->conn->$table->count($where);
		
		$this->sql[] = array('Action'=>'Count', 'Where'=>$where);
		$this->querynum++;
		
		return $result;
	}
	
	private function __formatMongoID( $array ){
		if(isset($array['_id'])) $array['_id'] = func_getMongoID($array['_id']);
		return $array;
	}
	
}