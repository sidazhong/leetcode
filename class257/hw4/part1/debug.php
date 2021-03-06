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
            $rs_files=$this->get_all_files(".","txt");
            if(!empty($rs_files)){
                foreach($rs_files as $v){
                    unlink($v);
                }
            }
            exit;
        }
        
        if($action=="debug"){
            
            $test=1275;
            $hex_json_obj=str_pad(dechex($test), 8, '0', STR_PAD_LEFT);
            $length="";
            foreach(str_split($hex_json_obj) as $k=>$v){
                if($k%2==0){
                    $tmp="";
                    $tmp.=$v;
                }else{
                    $tmp.=$v;
                    $length.=str_pad(hexdec($tmp), 3, '0', STR_PAD_LEFT)." ";
                    echo "{$tmp} ======== {$k} ========= {$length}\n";
                }
            }
            
            
            $position="000 000 004 251 ";
            $position_array=explode(" ",$position);
            unset($position_array[4]);
            $end="";
            foreach($position_array as $v){
                $end.=dechex($v);
            }
            $end=hexdec($end);
        }
    }
    
    static function d($data){
        print_r($data);
        echo "\n";
    }
    
    //get all .rss files
    function get_all_files($some_folder,$type){
        $rs = [];
        if ($handle = opendir($some_folder)) {
            while (false !== ($entry = readdir($handle))) {
                if ($entry != "." && $entry != "..") {
                    $pathinfo = pathinfo($entry);
                    if(!empty($pathinfo['extension'])){
                        if($pathinfo['extension']==$type){
                            $rs[]=$some_folder."/".$entry;
                        }
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
    
    //stackover flow
    function rsstotime($rss_time) {
        $day       = substr($rss_time, 5, 2);
        $month     = substr($rss_time, 8, 3);
        $month     = date('m', strtotime("$month 1 2011"));
        $year      = substr($rss_time, 12, 4);
        $hour      = substr($rss_time, 17, 2);
        $min       = substr($rss_time, 20, 2);
        $second    = substr($rss_time, 23, 2);
        $timezone  = substr($rss_time, 26);
        
        $timestamp = mktime($hour, $min, $second, $month, $day, $year);
        
        date_default_timezone_set('UTC');
        
        if(is_numeric($timezone)) {
            $hours_mod    = $mins_mod = 0;
            $modifier     = substr($timezone, 0, 1);
            $hours_mod    = (int) substr($timezone, 1, 2);
            $mins_mod     = (int) substr($timezone, 3, 2);
            $hour_label   = $hours_mod > 1 ? 'hours' : 'hour';
            $strtotimearg = $modifier . $hours_mod . ' ' . $hour_label;
            if($mins_mod) {
                $mins_label = $mins_mod > 1 ? 'minutes' : 'minute';
                $strtotimearg .= ' ' . $mins_mod . ' ' . $mins_label;
            }
            $timestamp = strtotime($strtotimearg, $timestamp);
        }
        
        return $timestamp;
    }
}


$obj=new debug(empty($argv[1])?"":$argv[1]);



































?>