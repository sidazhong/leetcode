note:
	For demo purpose, neo4j password authorization should be disabled. 
		file location: ~/neo4j.conf #uncommon "dbms.security.auth_enabled=false".
	
	relationship.php output memcache_key:"relationship" 60 seconds
	num_living_descendants.php output memcache_key:"num_living_descendants"  60 seconds

environment requirements:
	php7.2
	php7.2-memcache
	memcache (port:11211 #telnet 127.0.0.1 11211)
	neo4j (port:7474 #http://localhost:7474/browser/)

demo example:
	php add_person.php "sida zhong" 1989				
	php add_person.php "xiaoou zhong" 1959
	php add_person.php "lan ye" 1962
	php add_person.php "angel" 1962 2019

	php add_child.php "sida zhong" "lan ye"
	php add_child.php "sida zhong" "xiaoou zhong"
	php add_child.php "angel" "xiaoou zhong"

	php relationship.php "sida zhong" "lan ye"
	php relationship.php "sida zhong" "xiaoou zhong"
	php relationship.php "lan ye" "xiaoou zhong"

	php num_living_descendants.php "xiaoou zhong"
	php num_living_descendants.php "lan ye"

debug:
	php debug.php clear 	#remove all nodes 



























