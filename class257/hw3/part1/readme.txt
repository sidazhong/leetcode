part 1
	note:
		To get the terms in document I am using the "bag of words" function in PHP.
		I think it is more acurate than javascript. maybe not fully meet the requirment. 
		But I really hope that I can get parcial credit.
	
		disabled mongoDB password authorization. 
			file location: ~/mongod.conf 
				#authorization: enabled
		database name
			news
		collection name
			feed_items
			inverted_file
		
	environment requirements:
		php7.2
		php7.2-mongodb
		mongodb (veriosn 1.7 port:27017)
	
	demo example:
		php InvertNews.php ingest rss				
		php InvertNews.php query "COVID-19 Nigerian"		
	
	debug:
		php debug.php clear 	#remove all tables 

	
























