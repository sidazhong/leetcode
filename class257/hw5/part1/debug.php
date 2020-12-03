<?php 
/**
 * @author sida
 * 
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
        
        if($action=="debug"){
            $a=[[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]];
            $b=[[1],[1,2],[2,3,4],[3,4,5],[1,2,3,4,5]];
            //3
            
            $count=0;
            foreach($b as $v){
                if(in_array($v, $a)){
                    $count++;
                }
            }
            debug::d($count);
        }
        
    }
    
    static function d($data){
        print_r($data);
        echo "\n";
    }
    
    //get all .txt files
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
    
    function Descending($a, $b) {
        if ($a == $b) {
            return 0;
        }
        return ($a > $b) ? -1 : 1;
    }  
}


$obj=new debug(empty($argv[1])?"":$argv[1]);



































?>