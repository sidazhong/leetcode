<?php 

require_once 'debug.php';
class BtreeAppendExperiment extends debug{
    public $max=100000;
    
    function __construct($action=null){
        parent::__construct();
        if(empty($action)){
            echo "please enter the name_of_sqlite_file \n";
            exit;
        }
        $this->action=$action;
        
        shell_exec("rm foo{$action}");
        shell_exec("rm goo{$action}");
        shell_exec("rm moo{$action}");
        
        $this->obj_foo=new PDO("sqlite:foo{$action}");
        $this->obj_goo=new PDO("sqlite:goo{$action}");
        $this->obj_moo=new PDO("sqlite:moo{$action}");
    }
    
    function init_tables(){
        $query_create_tb_foo="CREATE TABLE foo
               (
               a INTEGER PRIMARY KEY AUTOINCREMENT,
               b INTEGER NOT NULL
               );";
        $this->obj_foo->query($query_create_tb_foo);
        
        $query_create_tb_goo="CREATE TABLE goo
               (
               a INTEGER PRIMARY KEY NOT NULL,
               b INTEGER NOT NULL
               );";
        $this->obj_goo->query($query_create_tb_goo);
        
        $query_create_tb_moo="CREATE TABLE moo
               (
               a INTEGER PRIMARY KEY NOT NULL,
               b INTEGER NOT NULL
               );";
        $this->obj_moo->query($query_create_tb_moo);
    }
    
    //insert 100,000 rows into foo where the rows use the autoincremented value for a and a random int for b.
    function insert_foo(){
        $rand = range(1,$this->max);
        shuffle($rand);
        
        $query_rand="";
        foreach($rand as $k=>$v){
            if($k==count($rand)-1){
                $query_rand.="({$v})";
            }else{
                $query_rand.="({$v}),";
            }
        }
        
        $time_start = microtime(true); 
        
        $query="INSERT INTO foo (b) VALUES {$query_rand}";
        $this->obj_foo->query($query);
        
        $time_end = microtime(true);
        $execution_time = ($time_end - $time_start);
        
        return $execution_time;
        
        /*
        $rand = range(1,$this->max);
        shuffle($rand);
        
        $time_start = microtime(true); 
        foreach($rand as $k=>$v){
            $query="INSERT INTO foo (b) VALUES ({$v})";
            $this->obj_foo->query($query);
        }
        $time_end = microtime(true);
        $execution_time = ($time_end - $time_start);
        
        return $execution_time;
        */
    }
    
    //insert 100,000 rows into goo where the rows use increasing value for a (1,...,100000) and a random int for b
    function insert_goo(){
        $rand = range(1,$this->max);
        shuffle($rand);
        
        $query_rand="";
        foreach($rand as $k=>$v){
            $a=$k+1;
            if($k==count($rand)-1){
                $query_rand.="({$a},{$v})";
            }else{
                $query_rand.="({$a},{$v}),";
            }
        }
        
        $time_start = microtime(true); 
        
        $query="INSERT INTO goo (a,b) VALUES {$query_rand}";
        $this->obj_goo->query($query);
        
        $time_end = microtime(true);
        $execution_time = ($time_end - $time_start);
        
        return $execution_time;
        
        /*
        $rand = range(1,$this->max);
        shuffle($rand);
        
        $time_start = microtime(true); 
        foreach($rand as $k=>$v){
            $a=$k+1;
            $query="INSERT INTO goo (a,b) VALUES ({$a},{$v})";
            $this->obj_goo->query($query);
        }
        $time_end = microtime(true);
        $execution_time = ($time_end - $time_start);
        
        return $execution_time;
        */
    }
    
    //insert 100,000 rows into moo where both (a) and (b) are chosen randomly
    function insert_moo(){
        $rand_a = range(1,$this->max);
        shuffle($rand_a);
        
        $rand_b = range(1,$this->max);
        shuffle($rand_b);
        
        $query_rand="";
        foreach($rand_b as $k=>$v){
            $a=$rand_a[$k];
            if($k==count($rand_b)-1){
                $query_rand.="({$a},{$v})";
            }else{
                $query_rand.="({$a},{$v}),";
            }
        }
        
        $time_start = microtime(true);
        
        $query="INSERT INTO moo (a,b) VALUES {$query_rand}";
        $this->obj_moo->query($query);
        
        $time_end = microtime(true);
        $execution_time = ($time_end - $time_start);
        
        return $execution_time;
        
        /*
        $rand_a = range(1,$this->max);
        shuffle($rand_a);
        
        $rand_b = range(1,$this->max);
        shuffle($rand_b);
        
        $time_start = microtime(true); 
        foreach($rand_b as $k=>$v){
            $a=$k+1;
            $query="INSERT INTO moo (a,b) VALUES ({$a},{$v})";
            $this->obj_moo->query($query);
        }
        $time_end = microtime(true);
        $execution_time = ($time_end - $time_start);
        
        return $execution_time;
        */
    }
}


$obj=new BtreeAppendExperiment(empty($argv[1])?"":$argv[1]);
$obj->init_tables();



$time_foo=$obj->insert_foo();
echo "time spent inserting foo is {$time_foo}\n\n";


$time_goo=$obj->insert_goo();
echo "time spent inserting goo is {$time_goo}\n\n";


$time_moo=$obj->insert_moo();
echo "time spent inserting moo is {$time_moo}\n\n";


















?>