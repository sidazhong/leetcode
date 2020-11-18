<?php 
/**
 * @author sida
 * 
 * 数据文件存储在news_data.txt json格式
 * item多加一项hash字段，是标题和内容的md5()
 * 新插入的新闻，需要用bloom检查是否存在
 * 
 * 问题：
 *  bloom filter的数据结构，memcache 或者 array ？
 *  concatenated sequence 数据例子  (length, JSON object) pairs ？
 * 
 * 主键是length，json对象的长度
 * 每3条新闻添加一个索引文件
 * 
 * 
 * Here 4096 next to trump above indicates there is a news item in news_data.txt starting at byte offset 4096 that contains the word trump.
 * When we look up that byte offset we could read the pair (length, JSON object) to determine the length of the JSON object, read that many bytes and decode the object to something we can pretty print.
 * If we ever have two inverted files of the same tier level
 * 
 */

class debug{
    function __construct($action=null,$some_folder=null){
        //clear every thing
        if($action=="clear"){
            echo "index cleaned\n";
            exit;
        }
        
        if($action=="debug"){
            $file=file_get_contents("news_data.txt");
            debug::D(substr($file,9457,16));
            exit;
        }
           
    }
    
    static function d($data){
        print_r($data);
        echo "\n";
    }
    
    //get all .rss files
    function get_all_files($some_folder){
        $rs = [];
        if ($handle = opendir($some_folder)) {
            while (false !== ($entry = readdir($handle))) {
                if ($entry != "." && $entry != "..") {
                    $pathinfo = pathinfo($entry);
                    if($pathinfo['extension']=='rss'){
                        $rs[]=$some_folder."/".$entry;
                    }
                }
            }
            
            closedir($handle);
        }
        
        return $rs;
    }
    
    function toBase($num, $b=62) {
        $base='0123456789';
        $r = $num  % $b ;
        $res = $base[$r];
        $q = floor($num/$b);
        while ($q) {
            $r = $q % $b;
            $q =floor($q/$b);
            $res = $base[$r].$res;
        }
        return $res;
    }
}


$obj=new debug(empty($argv[1])?"":$argv[1]);



































?>