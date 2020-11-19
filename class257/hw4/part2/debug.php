<?php 
/**
 * @author sida
 * 
 * mysql 
 * database: EXERCISE
 * table: WORK_OUT
 *  (longitude:float, latitude:float, workout_type:varchar(5), start-year:int, start-month:int, start-day:int, start-hour:int, start-minutes:int duration:int) 
 *  (37.33939,-121.89496, 'swim', 2020, 11, 30, 23, 10, 60)
 * 
 * 20 examples
 * 
 * 
 * 
 */

class debug{
    function __construct($action=null,$some_folder=null){
        //clear every thing
        if($action=="clear"){
            exit;
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
}


$obj=new debug(empty($argv[1])?"":$argv[1]);



































?>