<?php 
require_once 'debug.php';
class add_child extends debug{
    
    function __construct($child_name,$parent_name){
        parent::__construct();
        
        if(empty($child_name)){
            echo "Please enter the child_name\n";
            exit;
        }
        
        if(empty($parent_name)){
            echo "Please enter the parent_name\n";
            exit;
        }
        
        $this->child_name=$child_name;
        $this->parent_name=$parent_name;
    }
    
    function start(){
        $query="MATCH (child:person),(parent:person)
                WHERE child.name = '{$this->child_name}' AND parent.name = '{$this->parent_name}'
                CREATE (child)-[r:is_child]->(parent)
                RETURN type(r)";
        
        $rs=$this->obj_neo4j->run($query)->getRecord();
        if(empty($rs)){
            return "FAILURE\n";
        }else{
            return "SUCCESS\n";
        }
    }
}




$child_name=empty($argv[1])?"":$argv[1];
$parent_name=empty($argv[2])?"":$argv[2];

$obj=new add_child($child_name,$parent_name);
$rs=$obj->start();
echo $rs."\n";






















?>