<?php
/**
 * string类,默认为utf-8 要有宽字符集支持
 */

class strings {
    public $encoding;
    public function __construct($encoding='UTF-8')
    {
        $this->encoding = $encoding;
    }
    
    
    /**
     * 取得字符长度
     */
    public static function strlening($str)
    {
        return mb_strlen($str, $this->encoding);
    }
    
    /**
     * 提取文本中的链接信息
     *
     * @param text $content
     */
    public static function getHrefList($content,$img=false){
        $rs = array();
        $content = strings::tidy($content);
        $html = htmlDomNode::str_get_html( $content );
        foreach($html->find('a') as $e){
            if(empty($e->innertext))continue;
            if(!$img){
                if(strstr($e->innertext,'<img'))continue;
            }
            $rs[]=array('title'=>trim($e->innertext),'link'=>$e->href);
        }
        
        return $rs;
    }
    
     public static  function getImages($content){
        $domDocs = new DOMDocument();
        $domDocs->loadHTML($content);
        $domDocs->preserveWhiteSpace = false;
        $nodes = $domDocs->getElementsByTagName('img');
        
        $images=array();
        if($nodes->length>0){
            foreach($nodes as $node){
                $src=$node->getAttribute('src');
                $src=str_replace('\"', '', $src);
                if( !in_array($src, $images) ) $images[]=$src ;
            }
        }
        
        return $images;
    }
    
    public static function getLinks($content){
        $rs = array();
        $content = strings::tidy($content);
        $content = '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'.$content;
        
        $domDocs = new DOMDocument();
        @$domDocs->loadHTML($content);
        $domDocs->preserveWhiteSpace = false;
        
        $link = $domDocs->getElementsByTagName('a');
        if($link->length>0) foreach($link as $node) $rs[] = array('title'=>$node->textContent,'link'=>$node->getAttribute('href'));
        
        return $rs;
    }
    
    /**
     * 得到数据库安全变量（数据库查询前进行的处理操作）
     * @param mix $theValue
     * @param string $theType
     * @param mix $theValue
     */
    public static function sql( $theValue, $theType="text",$theDefinedValue="",$theNotDefinedValue="" )
    {
        //检查魔术符号
        if (!get_magic_quotes_gpc()) {
            $theValue=addslashes($theValue);
        }
        switch ( $theType ) {
            case "text":
                $theValue = ($theValue != "") ? dbtools::escape($theValue) : "NULL";
                break;
            case "cleartext":
                $theValue= ($theValue != "") ?dbtools::escape($theValue):"NULL";
                break;
            case "long":
            case "int":
                $theValue = ($theValue != "") ? intval($theValue) : "0";
                break;
            case "double":
                $theValue = ($theValue != "") ? "'" . doubleval($theValue) . "'" : "0";
                break;
            case "date":
                $theValue = ($theValue != "") ? "'" . $theValue . "'" : "0000-00-00";
                break;
            case "defined":
                $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
                break;
        }
        return $theValue;
    }//end function
    
    /**
     * 转成小写
     */
    public static function __tolower($str)
    {
        return mb_strtolower($str, $this->encoding);
    }
    
    /**
     * 转成大写
     */
    public static function __toupper($str)
    {
        return mb_strtoupper($str, $this->encoding);
    }
    
    /**
     * 反解配置字符串
     * @param unknown_type $str
     * @return unknown_type
     */
    public static function configStrDecode($str){
        $config=array();
        if(empty($str)) return $config;
        
        $arr=explode(',',$str);
        if(empty($arr)) return;
        
        foreach($arr as $val){
            $p=explode(':',$val);
            if(count($p)==2)$config[$p[0]]=$p[1];
        }
        
        return $config;
    }
    
    /**
     * 对由用户录入的内容进行过滤，防止执行用户写入的html代码
     *
     * @param string $str
     */
    public static function htmlFilter($str){
        $str=htmlspecialchars($str);//转义html
        $str=str_replace(" ", "&nbsp;", $str); //恢复空格
        return $str;
    }
    
    /**
     *
     * @param $rs  存储的推荐数据
     * @param $src  原数据主键对应的存储字段
     * @param $dst  原数据主键
     *
     * @return string
     */
    public static function idstr($rs,$src,$dst){
        if( empty($rs) )return "{$dst}=0";
        
        $ids=array();
        foreach($rs as $val){
            $ids[]=$val[$src];
        }
        
        $str="{$dst}=".implode(" or {$dst}=",$ids);
        return $str;
    }
    
    /**
     * $_SERVER['HTTP_ACCEPT_LANGUAGE']
     * 1、zh-cn,;q=0.5  中文简体
     * 2、zh-tw,zh  正体
     * 3、en 英文
     */
    public static function getSysLang(){
        static $lang;
        
        if(!isset($lang)){
            $lang = $_SERVER['HTTP_ACCEPT_LANGUAGE'];
            if( strstr($lang, ';') ){
                $tmp=explode(',', $lang);
                $lang=$tmp[0];
            }
            if( strstr($lang, ',') ){
                $tmp=explode(',', $lang);
                $lang=$tmp[0];
            }
        }
        
        return $lang;
    }
    
    
    /**
     * 生成随机字符
     */
    public static function getRandom($len, $type = "all", $userstr = "1234") {
        switch ($type) {
            case "num" :
                $str = '0123456789';
                break;
            case "low" :
                $str = 'abcdefghijklmnopqrstuvwxyz';
                break;
            case "cap" :
                $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                break;
            case "char" :
                $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
                break;
            case "user" :
                $str = $userstr;
                break;
            default :
                $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                break;
        }
        $str = str_repeat($str, 5);
        return substr(str_shuffle($str), 0, $len);
    }
    
    /**
     * Get content for search
     * @param $content string
     * @param $findme_begin string
     * @param $findme_end string
     * @return string
     */
    public static function findMe($content, $findme_begin, $findme_end) {
        if(empty($content)||empty($findme_begin)||empty($findme_end)) return false;
        if(!strstr($content, $findme_begin)) return false;
        
        $bn = strlen($findme_begin);
        $en = strlen($findme_end);
        $pos = 0;
        
        $pos1 = strpos($content, $findme_begin, $pos);
        
        $pos = $pos1 + $bn;
        if(strstr($content,$findme_end)){
            $pos2 = strpos($content, $findme_end, $pos);
            $pos = $pos2 + $en;
        }else{
            $pos2 = strlen($content);
        }
        
        $me = substr($content, ($pos1 + $bn), ($pos2 - $pos1 - $bn));
        return $me;
    }
    
    /**
     * Get content for search
     * @param $content string
     * @param $findme_begin string
     * @param $findme_end string
     * @return string
     */
    public static function findMeAll($content, $findme_begin, $findme_end) {
        $bn = strlen($findme_begin);
        $en = strlen($findme_end);
        $target = array ();
        $pos = 0;
        for ($i = 0; $i < substr_count($content, $findme_begin); $i++) {
            $pos1 = strpos($content, $findme_begin, $pos);
            $pos = $pos1 + $bn;
            $pos2 = strpos($content, $findme_end, $pos);
            $pos = $pos2 + $en;
            
            $target[] = substr($content, ($pos1 + $bn), ($pos2 - $pos1 - $bn));
        }
        
        return $target;
    }
    
    /**
     * 标签快速查找函数
     * @param int $pos 标签内的任意位置
     * @param string 标签所在文本
     * @param int $max 起始位置开始的最大查找范围
     * @return int 标签的开始位置
     */
    public static function findPosBegin($pos,$content,$max=200){
        $i=0;
        do{
            $me=substr($content ,$pos-$i-1 ,1);
            //echo $me;echo "<br>";
            $i++;
        }while($me!="<"&&$i<$max);
        return $pos-$i;
    }
    
    /**
     * 标签快速查找函数
     * @param int $pos 标签内的任意位置
     * @param string 标签所在文本
     * @param int $max 起始位置开始的最大查找范围
     * @return int 标签的结束位置
     */
    public static function findPosEnd($pos,$content,$max=200){
        $i=0;
        do{
            $me=substr($content ,$pos+$i ,1);
            //echo $me;echo "<br>";
            $i++;
        }while($me!=">"&&$i<$max);
        return $pos+$i;
    }
    
    /**
     * utf8字符串截取
     * @param string $string
     * @param int $length
     * @param string $etc
     * @param bool $count_words
     * @return string
     */
    public static function subString( $string,$length = 80,$etc='...',$count_words = true ) {
        mb_internal_encoding("UTF-8");
        $wordscut="";
        if ($length == 0) return '';
        
        if ( strlen( $string ) <= $length ) return $string;
        preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $string, $info);
        
        if( $count_words ){
            $j = 0;
            for($i=0; $i<count($info[0]); $i++) {
                $wordscut .= $info[0][$i];
                if( ord( $info[0][$i] ) >=128 ){
                    $j = $j+2;
                }else{
                    $j = $j + 1;
                }
                if ($j >= $length ) {
                    return $wordscut.$etc;
                }
            }
            return join('', $info[0]);
        }
        
        return join("",array_slice( $info[0],0,$length ) ).$etc;
    }
    
    /**
     * 转换js 中 escape函数处理过的中文字符
     *
     * @param string $str
     * @param string $to_encoding
     * @param string $from_encoding
     * @return $str
     */
    public static function unescape( $str, $to_encoding='utf-8', $from_encoding='gb2312' ){
        $obj=new strings();
        $text = preg_replace_callback("/%u[0-9A-Za-z]{4}/", array($obj,'toUtf8'), $str );
        return mb_convert_encoding($text, $to_encoding, $from_encoding );
    }
    
    /**
     * PHP中二维数组的排序方法
     * Sort an two-dimension array by some level two items use array_multisort() function.
     *
     * sortArray($Array,"Key1","SORT_ASC","SORT_RETULAR","Key2"……)
     * @param array $ArrayData the array to sort.
     * @param string $KeyName1 the first item to sort by.
     * @param string $SortOrder1 the order to sort by("SORT_ASC"|"SORT_DESC")
     * @param string $SortType1 the sort type("SORT_REGULAR"|"SORT_NUMERIC"|"SORT_STRING")
     * @return array sorted array.
     */
    public static function sortArray($ArrayData,$KeyName1,$SortOrder1 = "SORT_ASC",$SortType1 = "SORT_REGULAR"){
        if(!is_array($ArrayData))
        {
            return $ArrayData;
        }
        
        // Get args number.
        $ArgCount = func_num_args();
        
        // Get keys to sort by and put them to SortRule array.
        for($I = 1;$I < $ArgCount;$I ++)
        {
            $Arg = func_get_arg($I);
            if(!eregi("SORT",$Arg))
            {
                $KeyNameList[] = $Arg;
                $SortRule[] = '$'.$Arg;
            }
            else
            {
                $SortRule[] = $Arg;
            }
        }
        
        // Get the values according to the keys and put them to array.
        foreach($ArrayData AS $Key => $Info)
        {
            foreach($KeyNameList AS $KeyName)
            {
                ${$KeyName}[$Key] = isset($Info[$KeyName])?$Info[$KeyName]:'';
            }
        }
        
        // Create the eval string and eval it.
        $EvalString = 'array_multisort('.join(",",$SortRule).',$ArrayData);';
        eval ($EvalString);
        return $ArrayData;
    }
    
    /**
     * 转换utf8编码
     *
     * @param unknown_type $ar
     * @return unknown
     */
    public static function toUtf8($ar){
        $c='';
        foreach($ar as $val){
            $val = intval(substr($val,2),16);
            if($val < 0x7F){ // 0000-007F
                
                $c .= chr($val);
            }elseif($val < 0x800) { // 0080-0800
                
                $c .= chr(0xC0 | ($val / 64));
                $c .= chr(0x80 | ($val % 64));
            }else{ // 0800-FFFF
                
                $c .= chr(0xE0 | (($val / 64) / 64));
                $c .= chr(0x80 | (($val / 64) % 64));
                $c .= chr(0x80 | ($val % 64));
            }
        }
        return $c;
    }
    
    /**
     * 处理搜索条件
     */
    public static function escapeQuery($str,$maxNum=40){
        $str=strings::escapeXML($str);
        $str=strings::subString($str,$maxNum);
        $special=array("\\",'+','-','&&','||','!','(',')','[',']','^','"','~','*','?',':');
        foreach($special as $char){
            if(strstr($str, $char)) $str = str_replace($char, "\\".$char, $str);
        }
        return $str;
    }
    
    /**
     * 处理XML
     */
    public static function escapeXML ($input) {
        $output="";
        $patterns = array(
            "/\s+/",
            "/[\x-\x8\xb-\xc\xe-\x1f]/", //escape invalid Unicode in XML
            "/<.*?>/"  //remove html tag
        );
        $replace = array(
            " ",
            " ",
            ""
        );
        $output .= preg_replace($patterns, $replace, $input);
        return trim(htmlspecialchars($output));
    }
    
    /**
     * 判断是否有中文字符
     */
    public static function isChineseWord($string){
        mb_internal_encoding("UTF-8");
        preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $string, $info);
        for($i=0; $i<count($info[0]); $i++) {
            if( ord( $info[0][$i] ) >=128 )return true;
        }
        return false;
    }
    
    /**
     * 判断是否是UTF8
     * @param 字符串 $str
     * @return 1/0
     */
    public static function isUTF8($str) {
        return preg_match('%^(?:
	    [\x09\x0A\x0D\x20-\x7E] # ASCII
	    | [\xC2-\xDF][\x80-\xBF] # non-overlong 2-byte
	    | \xE0[\xA0-\xBF][\x80-\xBF] # excluding overlongs
	    | [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2} # straight 3-byte
	    | \xED[\x80-\x9F][\x80-\xBF] # excluding surrogates
	    | \xF0[\x90-\xBF][\x80-\xBF]{2} # planes 1-3
	    | [\xF1-\xF3][\x80-\xBF]{3} # planes 4-15
	    | \xF4[\x80-\x8F][\x80-\xBF]{2} # plane 16
	    )*$%xs', $str);
    }
    
    /**
     * 将unicode转换成utf8编码
     * @param string $str
     */
    public static function unicode2utf8($str){
        if(!$str) return $str;
        
        $decode = json_decode($str);
        if($decode) return $decode;
        
        $str = '["' . $str . '"]';
        $decode = json_decode($str);
        if(count($decode) == 1) return $decode[0];
        
        return $str;
    }
    
    /**
     * 检查合法的邮件地址
     */
    public static function verify_EmailAddr ($address) {
        return (strlen($address)>6) && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/",$address);
    }
    
    /**
     * 检查路径结尾
     * @param string $str
     * @param string $endchar
     */
    public static function endstr($str,$endchar='/'){
        if(empty($str)) return;
        
        $len=strlen($str);
        if(substr($str,$len-1)!=$endchar)$str.=$endchar;
        
        return $str;
    }
    
    /**
     * 对字串内容进行重新排序
     *
     * 如：
     * border: medium none #DFDFDF;background:none repeat scroll 0 0 #F2F2F2; margin-bottom:10px;padding:10px;width:629px;
     * 随机变成
     * background:none repeat scroll 0 0 #F2F2F2;padding:10px;border: medium none #DFDFDF;margin-bottom:10px;width:629px;
     */
    public static function reLoadStr($delimiter, $string){
        $tmp=explode($delimiter,$string);
        $result =array();
        foreach($tmp as $v){
            if(empty($v))continue;
            $key=strings::getKey($result);
            $result[$key]=trim($v);
        }
        
        krsort($result);
        $str = implode($delimiter,$result);
        
        return $str.$delimiter;
    }
    
    public static function getKey($rs){
        $key=rand();
        if(isset($rs[$key])) {
            return strings::getKey($rs);
        }else{
            return $key;
        }
    }
    
    /**
     * nl2br的升级版
     *
     * @param string $content
     * @throws Exceptions
     */
     public static function nl2br($content){
        //对于有代码设置分段的内容，直接返回
        foreach( array("<br>","<p>","<br />")  as $tag){
            if( strstr($content,$tag)) return $content;
        }
        
        $content = nl2br($content);
        $content = str_replace("<br />\n<br />", "<br />", $content); //尽量减少不兼容代码产生的过多空行
        
        return $content;
    }
    
    /**
     * 格式化html
     *
     * 所有可用的tidy选项
     *	 $default = array
     (
     'anchor-as-name' => false,
     'break-before-br' => true,
     'char-encoding' => $encoding,
     'decorate-inferred-ul' => false,
     'doctype' => 'omit',
     'drop-empty-paras' => false,
     'drop-font-tags' => true,
     'drop-proprietary-attributes' => false,
     'force-output' => false,
     'hide-comments' => false,
     'indent' => true,
     'indent-attributes' => false,
     'indent-spaces' => 2,
     'input-encoding' => $encoding,
     'join-styles' => false,
     'logical-emphasis' => false,
     'merge-divs' => false,
     'merge-spans' => false,
     'new-blocklevel-tags' => 'article aside audio details dialog figcaption figure footer header hgroup menutidy nav section source summary track video',
     'new-empty-tags' => 'command embed keygen source track wbr',
     'new-inline-tags' => 'canvas command data datalist embed keygen mark meter output progress time wbr',
     'newline' => 0,
     'numeric-entities' => false,
     'output-bom' => false,
     'output-encoding' => $encoding,
     'output-html' => true,
     'preserve-entities' => true,
     'quiet' => true,
     'quote-ampersand' => true,
     'quote-marks' => false,
     'repeated-attributes' => 1,
     'show-body-only' => true,
     'show-warnings' => false,
     'sort-attributes' => 1,
     'tab-size' => 4,
     'tidy-mark' => false,
     'vertical-space' => true,
     'wrap' => 0,
     );
     
     * @param string $html
     * @return string
     *
     */
    public static function tidy($html){
        
        if(!function_exists('tidy_repair_string'))
            return $html;
            
            // tidy 的参数设定
            $conf = array(
                'output-xhtml'=>true,
                'drop-empty-paras'=>true,
                'join-classes'=>true,
                'show-body-only'=>true,
                'new-blocklevel-tags' => 'article aside audio details figcaption figure footer header hgroup nav section source summary temp track video',
                'new-empty-tags' => 'command embed keygen source track wbr',
                'new-inline-tags' => 'audio canvas command datalist embed keygen mark meter output progress time video wbr',
            );
            
            //repair
            $str = tidy_repair_string($html,$conf,'utf8');
            //生成解析树
            $str = tidy_parse_string($str,$conf,'utf8');
            
            $s ='';
            
            //得到body节点
            $body = @tidy_get_body($str);
            
            //通过上面的函数 对 body节点开始过滤。
            if($body->child){
                foreach($body->child as $child){
                    strings::_dumpnode($child,$s);
                }
            }else{
                return '';
            }
            
            return $s;
    }
    
    /**
     * 格式化html时用到的内置函数
     *
     * @param unknown_type $node
     * @param unknown_type $s
     */
    public static function _dumpnode($node,&$s){
        //查看节点名，如果是<script> 和<style>就直接清除
        if($node->name=='script'){
            return;
        }
        
        if($node->type == TIDY_NODETYPE_TEXT){
            $s .= $node->value;
            return;
        }
        
        //不是文字节点，那么处理标签和它的属性
        $s .= '<'.$node->name;
        
        //检查每个属性
        if($node->attribute){
            foreach($node->attribute as $name=>$value){
                /*
                 清理一些DOM事件，通常是on开头的，
                 比如onclick onmouseover等....
                 或者属性值有javascript:字样的，
                 比如href="javascript:"的也被清除.
                 */
                if(strpos($name,'on') === 0 ||stripos(trim($value),'javascript:') ===0 ){
                    continue;
                }
                
                //保留安全的属性
                $s .= ' '.$name.'="'.$value.'"';
            }
        }
        
        //递归检查该节点下的子节点
        if($node->child){
            $s .= '>';
            foreach($node->child as $child){
                strings::_dumpnode($child,$s);
            }
            //子节点处理完毕，闭合标签
            $s .= '</'.$node->name.'>';
        }else{
            /*
             已经没有子节点了，将标签闭合
             (事实上也可以考虑直接删除掉空的节点)
             */
            if($node->type == TIDY_NODETYPE_START)
                $s .= '></'.$node->name.'>';
                else
                    /*
                     对非配对标签，比如<hr/> <br/> <img/>等
                     直接以 />闭合之
                     */
                         $s .= '/>';
        }
    }
    
     public static function tel_format($number, $countrycode='1',$delimiter="-",$prefix=true){
        $n = strlen($countrycode);
        if($n!=0)
            if(substr($number,0,$n)==$countrycode)
                $number = substr($number,$n);
                
        //US
		if($countrycode=='1'){
		    $number = substr($number,0,3).$delimiter.substr($number,3,3).$delimiter.substr($number,6);
		}
		
		//China
		if($countrycode=='86'){
		    $number = substr($number,0,3).$delimiter.substr($number,3,4).$delimiter.substr($number,7);
		}
		
		if($prefix) $number = "+{$countrycode} {$number}";
		
		return $number;
    }
    
    /**
     * 生成兼容 dotNet.Membership.GenerateSalt 的散列比对密码串
     */
    public static function generateSalt(){
    	return base64_encode(mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_CAST_256, MCRYPT_MODE_CFB), MCRYPT_DEV_RANDOM));
    }
    
    /**
     * 使用php生成兼容 dotNet.Membership.EncodePassword 的散列比对密码串
     *
     * @param string $password
     * @param string $salt store in db
     * @param string $func sha1/sha256
     *
     * @return string $password store in db
     */
    public static function encodePassword($password, $salt, $func='sha1'){
    	$decodedSalt = base64_decode($salt);
    	$utf = mb_convert_encoding($password, 'UTF-16LE', 'UTF-8');
    	return base64_encode($func($decodedSalt.$utf, true));
    }
}
?>