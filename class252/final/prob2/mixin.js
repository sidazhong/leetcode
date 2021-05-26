"use strict";

function addMixin(o, mixin) {
  //
  // ***YOUR CODE HERE***
  //
	const handler = {
		  get: function (get_target, prop, receiver) {
		  	//If the object already has a property, the object’s property is returned.
		  	if(get_target[prop]){
		  		return get_target[prop];
		  	}
		  	//If the property is original, it returns the original object o.
		  	else if(prop == "__original"){
		  		return o;
		  	}
		  	//If the object does not have the property, it returns the property from the mixin object.
		  	else{
		  		return mixin[prop];
		  	}
		  	
		  	//If none of the other cases hold, undefined should be returned as the result.
		  	return undefined;
		  },
	};
	const proxy = new Proxy(o, handler);
	return proxy;
}

// A sample mixin.
let PlayableMixin = {
  // Plays a system bell 3 times
  play: function() {
    console.log("\u0007");
    console.log("\u0007");
    console.log("\u0007");
  },
  duration: 100,
};

function Song(name, performer, duration) {
  this.name = name;
  this.performer = performer;
  this.duration = duration;
}
Song.prototype = addMixin(Song.prototype, PlayableMixin);
Song.prototype.display = function() {
  console.log(`Now playing "${this.name}", by ${this.performer}. (${this.duration})`);
}

let s = new Song("Gun Street Girl", "Tom Waits", "4:17");

s.display();
s.play();

console.log(s.duration);

s = s.__original;
console.log(s.play);




























