<?php 
require_once 'debug.php';
class relationship extends debug{
    
    function __construct($name1,$name2){
        parent::__construct();
        
        if(empty($name1)){
            echo "Please enter the name1\n";
            exit;
        }
        
        if(empty($name2)){
            echo "Please enter the name2\n";
            exit;
        }
        
        $this->name1=$name1;
        $this->name2=$name2;
    }
    
    function start(){
        $result="";
        $key_memcache="relationship";
        
        $rs_memcache=$this->obj_memcache->get($key_memcache);
        if(!empty($rs_memcache)){
            return $rs_memcache;
        }
        
        $query="
            MATCH (a:person { name: '{$this->name1}' }),(b:person { name: '{$this->name2}' }), p = shortestPath((a)-[*..100]-(b))
            RETURN p";
        
        $rs=$this->obj_neo4j->run($query)->getRecord();
        if(empty($rs)){
            $result="NOT_RELATED\n";
        }else{
            if(!empty($rs->value('p'))){
                $result="RELATED\n";
            }else{
                $result="NOT_RELATED\n";
            }
        }
        
        $this->obj_memcache->set($key_memcache,$result,false,60);
        return $result;
    }
}




$name1=empty($argv[1])?"":$argv[1];
$name2=empty($argv[2])?"":$argv[2];

$obj=new relationship($name1,$name2);
$rs=$obj->start();
echo $rs."\n";





















?>