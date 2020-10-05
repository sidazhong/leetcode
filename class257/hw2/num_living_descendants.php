<?php 
require_once 'debug.php';
class num_living_descendants extends debug{
    
    function __construct($name){
        parent::__construct();
        
        if(empty($name)){
            echo "Please enter the name\n";
            exit;
        }
        
        $this->name=$name;
    }
    
    function start(){
        $count=0;
        $key_memcache="num_living_descendants";
        
        $rs_memcache=$this->obj_memcache->get($key_memcache);
        if(!empty($rs_memcache)){
            return $rs_memcache;
        }
        
        $query="MATCH (child:person)-[r:is_child]->(parent:person) where parent.name='{$this->name}' and NOT EXISTS(child.death_year) RETURN COUNT(r)";
        $rs=$this->obj_neo4j->run($query)->getRecord();
        if(!empty($rs)){
            $count=$rs->value("COUNT(r)");
        }
        
        $this->obj_memcache->set("num_living_descendants",$count,false,60);
        return $count;
    }
}


$name=empty($argv[1])?"":$argv[1];

$obj=new num_living_descendants($name);
$rs=$obj->start();
echo $rs."\n";






















?>