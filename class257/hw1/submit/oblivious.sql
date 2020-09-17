/*
ID				PARENT_ID				TYPE				LABEL						VALUE
1					NULL						element			company					NULL
2					1								element			shopping_cart		NULL
3					2								attribute		user						sida
4					2								element			item						NULL
5					4								element			ID							1
6					4								element			type						orange
7					4								element			price						10
8					4								element			vendor					Sunshine Farm
9					2								element			item						NULL
10				9								element			ID							1
11				9								element			type						apple
12				9								element			price						2
13				9								element			vendor					Sunshine Farm
*/

/* create table cart1.xml 
	CREATE TABLE NODE(ID CHAR(6) NOT NULL PRIMARY KEY,PARENT_ID CHAR(6),TYPE VARCHAR(9),LABEL VARCHAR(20),VALUE TEXT,FOREIGN KEY (PARENT_ID) REFERENCES NODE (ID));                  
*/
CREATE TABLE NODE(
	ID CHAR(6) NOT NULL PRIMARY KEY,
	PARENT_ID CHAR(6),
	TYPE VARCHAR(9),
	LABEL VARCHAR(20),
	VALUE TEXT,
	FOREIGN KEY (PARENT_ID) REFERENCES NODE (ID)
);

/* 
	insert table cart1.xml 
	INSERT INTO NODE (ID,PARENT_ID,TYPE,LABEL,VALUE) VALUES (1,NULL,'element','company',NULL),(2,1,'element','shopping_cart',NULL),(3,2,'attribute','user','sida'),(4,2,'element','item',NULL),(5,4,'element','ID','1'),(6,4,'element','type','orange'),(7,4,'element','price','10'),(8,4,'element','vendor','Sunshine Farm'),(9,2,'element','item',NULL),(10,9,'element','ID','1'),(11,9,'element','type','apple'),(12,9,'element','price','2'),(13,9,'element','vendor','Sunshine Farm');            
*/
INSERT INTO 
	NODE (ID,PARENT_ID,TYPE,LABEL,VALUE)
VALUES
	(1,NULL,'element','company',NULL),
	(2,1,'element','shopping_cart',NULL),
	(3,2,'attribute','user','sida'),
	(4,2,'element','item',NULL),
	(5,4,'element','ID','1'),
	(6,4,'element','type','orange'),
	(7,4,'element','price','10'),
	(8,4,'element','vendor','Sunshine Farm'),
	(9,2,'element','item',NULL),
	(10,9,'element','ID','1'),
	(11,9,'element','type','apple'),
	(12,9,'element','price','2'),
	(13,9,'element','vendor','Sunshine Farm');


/* 
	select table cart1.xml 
	SELECT N2.ID,N2.PARENT_ID,N2.TYPE,N2.LABEL,N2.VALUE FROM NODE N1, NODE N2 WHERE N2.LABEL='type' AND N1.LABEL='price' AND CAST(N1.VALUE AS INT) > 5 AND CAST(N1.VALUE AS INT) < 15 AND  N1.PARENT_ID=N2.PARENT_ID;
*/
SELECT N2.ID,N2.PARENT_ID,N2.TYPE,N2.LABEL,N2.VALUE
FROM NODE N1, NODE N2 WHERE
N2.LABEL='item' AND N1.LABEL='price'
AND CAST(N1.VALUE AS INT) > 5 
AND CAST(N1.VALUE AS INT) < 15
AND N1.PARENT_ID=N2.PARENT_ID;





































