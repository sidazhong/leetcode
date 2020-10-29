<?php 

/**
 * @author sida
 * sudo systemctl start mongod.service
 * sudo systemctl status mongod
 * sudo systemctl enable mongod
 * mongo --eval 'db.runCommand({ connectionStatus: 1 })'
 * 127.0.0.1:27017
 * 
 * sudo systemctl status mongod
 * sudo systemctl stop mongod
 * sudo systemctl start mongod
 * sudo systemctl restart mongod
 * sudo systemctl disable mongod
 * sudo systemctl enable mongod
 * 
 * sudo apt install php7.2-dev
 * sudo apt install php7.2-mongodb
 * #security:
    #authorization: enabled
 * 
 * create DB news
 * collection feed_items
 * 
 * http://zetcode.com/db/mongodbphp/
 * https://data-flair.training/blogs/mongodb-php-tutorial/
 * 
 * https://github.com/mongodb/mongo-php-library
 * https://docs.mongodb.com/php-library/current/tutorial/crud/
 * 
 * https://docs.mongodb.com/php-library/v1.2/reference/method/MongoDBCollection-mapReduce/
 * https://appdividend.com/2018/10/26/mongodb-mapreduce-example-tutorial/
 */

require_once __DIR__ . '/vendor/autoload.php';
class debug{
    function __construct($action=null,$some_folder=null){
        $this->obj_feed_items = (new MongoDB\Client)->news->feed_items;
        $this->obj_inverted_file =  (new MongoDB\Client)->news->inverted_file;
        
        //clear every thing
        if($action=="clear"){
            $this->obj_feed_items->drop();
            $this->obj_inverted_file->drop();
            echo "collection cleared\n";
            exit;
        }
    }
    
    static function d($data){
        print_r($data);
        
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