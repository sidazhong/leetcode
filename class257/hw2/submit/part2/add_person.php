<?php 
require_once 'debug.php';
class add_person extends debug{
    
    function __construct($name,$birth_year,$death_year){
        parent::__construct();
        if(empty($name)){
            echo "Please enter the name\n";
            exit;
        }
        
        if(empty($birth_year)){
            echo "Please enter the birth year\n";
            exit;
        }
        
        $this->name=$name;
        $this->birth_year=$birth_year;
        $this->death_year=$death_year;
    }
    
    function start(){
        if(!empty($this->check("person",$this->name))){
            return "person already added\n";
        }
        
        $death_year_query="";
        if(!empty($this->death_year)){
            $death_year_query=", death_year: '{$this->death_year}'";
        }
        $query="CREATE (n:person { name: '{$this->name}', birth_year: '{$this->birth_year}' {$death_year_query}})";
        $rs=$this->obj_neo4j->run($query);
        
        if(empty($rs)){
            return "FAILURE\n";
        }else{
            return "SUCCESS\n";
        }
    }
}



$name=empty($argv[1])?"":$argv[1];
$birth_year=empty($argv[2])?"":$argv[2];
$death_year=empty($argv[3])?"":$argv[3];

$obj=new add_person($name,$birth_year,$death_year);
$rs=$obj->start();
echo $rs."\n";






















?>