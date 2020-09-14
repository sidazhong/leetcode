/* 
check version
/usr/lib/postgresql/12/bin/postgres --version

access
	sudo -i -u postgres
	psql
quit
	\q
	exit
List available databases
	\l
Connect to a database
	\c dbname
List available tables
	\dt

create schema and table
	create schema test_schema;
	create table test_schema.test_table (id int);
	create table test_schema.test_table_2 (id int);

show tables name
	\dt test_schema.

show table definition
	\d test_schema.test_table

show all tables definition
	\d test_schema.
*/

/*
company
	ID  
	1

shopping_cart
	ID		companyID		user
	1			1						sida

item
	ID		shopping_cartID		type			price		vendor
	1			1									orange		10			Sunshine Farm
	2			1									apple			2				Sunshine Farm
*/

/* create table cart1.xml */
CREATE TABLE company(
	ID INT NOT NULL PRIMARY KEY
);

CREATE TABLE shopping_cart(
	ID INT NOT NULL PRIMARY KEY,
	companyID INT,
	FOREIGN KEY (companyID) REFERENCES company (ID),
	"user" VARCHAR(55) NOT NULL
);

CREATE TABLE item(
	ID INT NOT NULL PRIMARY KEY,
	shopping_cartID INT,
	FOREIGN KEY (shopping_cartID) REFERENCES shopping_cart (ID),
	type VARCHAR(55),
 	price VARCHAR(55),
 	vendor VARCHAR(55)
);

CREATE TABLE collection(
	ID INT NOT NULL PRIMARY KEY,
	itemID INT,
	FOREIGN KEY (itemID) REFERENCES item (ID),
	item_name VARCHAR(55)
);

/* insert table cart1.xml */
 	INSERT INTO TABLE company (ID)
 	VALUES
	 	(1);

	INSERT INTO TABLE shopping_cart (ID,companyID,user)
 	VALUES
	 	(1,1,'sida');

	INSERT INTO TABLE item (ID,shopping_cartID,type,price,vendor)
 	VALUES
	 	(1,1,'ornage','10','Sunshine Farm'),
		(2,1,'apple','2','Sunshine Farm');
	);




/* HW1 */
INSERT INTO NODE (ID,PARENT_ID,TYPE,LABEL,VALUE) VALUES (1,NULL,'element','company',NULL),(2,1,'element','shopping_cart',NULL),(3,2,'attribute','user','sida'),(4,2,'element','item',NULL),(5,4,'element','ID','1'),(6,4,'element','type','orange'),(7,4,'element','price','10'),(8,4,'element','vendor','Sunshine Farm'),(9,2,'element','item',NULL),(10,9,'element','ID','1'),(11,9,'element','type','apple'),(12,9,'element','price','2'),(13,9,'element','vendor','Sunshine Farm');            


DELETE FROM table_name


//check table cart
    function check_relation_cart(){
        //check table
        $query_check_cart = "select table_name FROM information_schema.tables WHERE table_name = 'company' or table_name = 'shopping_cart' or table_name = 'item' or table_name = 'collection';";                                                                          
        $rs_check_cart = $this->obj_shopping->exec($query_check_cart);
        
        //create table 
        if(empty($rs_check_cart)){
            //create company
            $query_create_company = 'CREATE TABLE IF NOT EXISTS company(ID INT NOT NULL PRIMARY KEY);';
            $this->obj_shopping->exec($query_create_company);
            
            //create shopping_cart
            $query_create_shopping_cart = 'CREATE TABLE IF NOT EXISTS shopping_cart(ID INT NOT NULL PRIMARY KEY,companyID INT,FOREIGN KEY (companyID) REFERENCES company (ID),"user" VARCHAR(55) NOT NULL);';
            $this->obj_shopping->exec($query_create_shopping_cart);
            
            //create item
            $query_create_item = 'CREATE TABLE IF NOT EXISTS item(ID INT NOT NULL PRIMARY KEY,shopping_cartID INT,FOREIGN KEY (shopping_cartID) REFERENCES shopping_cart (ID),type VARCHAR(55),price VARCHAR(55),vendor VARCHAR(55));';
            $this->obj_shopping->exec($query_create_item);
            
            //create collection
            $query_create_collection = 'CREATE TABLE IF NOT EXISTS collection(ID INT NOT NULL PRIMARY KEY,itemID INT,FOREIGN KEY (itemID) REFERENCES item (ID),item_name VARCHAR(55));';
            $this->obj_shopping->exec($query_create_collection);
        }
    }









