"use strict";

let crypto = require('crypto');

const MAX_RANGE = 256;

function sample(UR) {
	//Returns a random number between 0 and UR.
	return Math.floor(Math.random() * Math.floor(UR));
	
	//Returns a random number between 0 and 255.
  //return crypto.randomBytes(1).readUInt8();
}

exports.nextInt = function(range) {
  if (range > MAX_RANGE) {
    throw new Error(`Sorry, range cannot be more than ${MAX_RANGE}`);
  }
  
  let UR = Math.floor(MAX_RANGE/range) * range;
  return sample(UR) % range;
}


