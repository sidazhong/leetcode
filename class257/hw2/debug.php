<?php 

/**
 * @author sida
 * sudo service neo4j start
 * https://github.com/graphaware/neo4j-php-client
 * $result = $client->run('MATCH (n:Person) RETURN n');
 * 
 * http://localhost:7474/browser/
 * Neo4j Neo4j
 * 
 * :begin
 * SHOW DATABASES
 * 
 * MATCH (n) RETURN n LIMIT 25    //show all nodes
 * CREATE (n:Person { name: 'Andy', title: 'Developer' })
 * 
 */

require_once 'vendor/autoload.php';
use GraphAware\Neo4j\Client\ClientBuilder;

class debug{
    function __construct($action=null){
        //connect memcache
        $this->obj_memcache=@memcache_connect("127.0.0.1", "11211");
        
        //connect neo4j
        $this->obj_neo4j = ClientBuilder::create()
        ->addConnection('default', 'http://neo4j:password@localhost:7474') 
        ->build();
        
        //clear all nides
        if($action=='clear'){
            $this->obj_neo4j->run('MATCH (n) DETACH DELETE n');
        }
        
        //create all testing relations
        if($action=='create'){
            //grand
            if(empty($this->check("person","weihua zhong"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'weihua zhong', birth_year: '1929', death_year:'2016'})");
            }
            if(empty($this->check("person","guiyan chu"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'guiyan chu', birth_year: '1932'})");
            }
            if(empty($this->check("person","changgen ye"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'changgen ye', birth_year: '1929', death_year:'2010'})");
            }
            if(empty($this->check("person","xiaorui qi"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'xiaorui qi', birth_year: '1932', death_year:'2018'})");
            }
            //angel
            if(empty($this->check("person","angel zhong"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'angel zhong', birth_year: '1962', death_year:'2019'})");
            }
            //parent
            if(empty($this->check("person","xiaoou zhong"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'xiaoou zhong', birth_year: '1959'})");
            }
            if(empty($this->check("person","lan ye"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'lan ye', birth_year: '1962'})");
            }
            //me
            if(empty($this->check("person","sida zhong"))){
                $this->obj_neo4j->run("CREATE (n:person { name: 'sida zhong', birth_year: '1989'})");
            }
        }
    }
    
    static function d($data){
        print_r($data);
    }
    
    function check($type,$name){
        $rs_check=$this->obj_neo4j->run("MATCH (n:{$type} { name: '{$name}' }) RETURN n LIMIT 1");
        return $rs_check->getRecord();
    }
}


$obj=new debug(empty($argv[1])?"":$argv[1]);



































?>