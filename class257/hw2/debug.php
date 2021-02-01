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
 * 
    
MATCH (n)
DETACH DELETE n
  
MATCH (n) RETURN n LIMIT 25
  
CREATE (n:person { name: "Person_0"})
CREATE (n:person { name: "Person_1"})
CREATE (n:person { name: "Person_2"})
CREATE (n:person { name: "Person_3"})
CREATE (n:person { name: "Person_4"})
CREATE (n:person { name: "Person_5"})
CREATE (n:person { name: "Person_6"})
CREATE (n:person { name: "Person_7"})
CREATE (n:person { name: "Person_8"})
CREATE (n:person { name: "Person_9"})
  
MATCH (self:person) WHERE self.name = 'Person_0' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_1' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_2' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_3' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_4' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_5' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_6' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_7' CREATE (self)-[r:know]->(self) 
MATCH (self:person) WHERE self.name = 'Person_8' CREATE (self)-[r:know]->(self)
MATCH (self:person) WHERE self.name = 'Person_9' CREATE (self)-[r:know]->(self) 
  
MATCH (first:person),(second:person) WHERE first.name = 'Person_0' AND second.name = 'Person_1' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_1' AND second.name = 'Person_2' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_2' AND second.name = 'Person_3' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_3' AND second.name = 'Person_4' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_4' AND second.name = 'Person_5' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_5' AND second.name = 'Person_6' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_6' AND second.name = 'Person_7' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_7' AND second.name = 'Person_8' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_8' AND second.name = 'Person_9' CREATE (first)-[r:know]->(second)
MATCH (first:person),(second:person) WHERE first.name = 'Person_9' AND second.name = 'Person_7' CREATE (first)-[r:know]->(second)


MATCH (p1:person)-[:know]->(p2:person) 
WITH p1,count(p2) as count
WHERE count > 1
RETURN p1

MATCH (p1:person)-[:know]->(p2:person) 
WITH p1,count(p2) as count
WHERE count > 1
RETURN p1

MATCH (a:person { name: '{$this->name1}' }),(b:person { name: '{$this->name2}' }), p = shortestPath((a)-[*..100]-(b))
RETURN p";


MATCH (p1:person)-[:know]->(p2:person), (p2:person)-[:know]->(p3:person)
WHERE p3.name = "Person_7"
RETURN p1


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