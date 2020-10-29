function() { 
	let key = "$key";
	if(this.title !== undefined && this.description!==undefined){
		if(this.title.includes(key) || this.description.includes(key)){
			emit(key,this.timestamp); 
		}
	}
}