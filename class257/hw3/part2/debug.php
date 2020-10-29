<?php 


/**
 * @author sida
 * sudo apt install sqlite3
 * sqlite3 --version
 * sudo apt install sqlitebrowser
 * sqlitebroswer –version
 * 
 * example
 * https://www.osradar.com/install-sqlite-ubuntu-20-04/
 * 
 * driver
 * https://www.sqlitetutorial.net/sqlite-php/connect/
 * 
 * apt-get install php7.2-sqlite3
 * 
 * sqlite3 db
 * .table
 * 
 */

class debug{
    function __construct($action=null){
        if($action=="clear"){
            //shell_exec('rm db');
        }
    }
    
    static function d($data){
        print_r($data);
    }
    
}


$obj=new debug(empty($argv[1])?"":$argv[1]);



































?>