"use strict";
let crypto = require('crypto');
let modularDivision = require('./modularDivision.js');

function encrypt(message, pubKey) {
  let ciphertext = message ** pubKey.e % pubKey.N;
  return ciphertext;
}

function decrypt(ciphertext, privKey) {
  let message = ciphertext ** privKey.d % privKey.N;
  return message;
}

function blind(message, pubKey) {
  //let r = 16;
  let r = Math.floor(Math.random() * 88) + 1;
	
	//M' = M * Be mod N
	let blinded = message * r ** pubKey.e % pubKey.N;
	return {blinded:blinded,r:r};
}

function sign(blinded, privKey) {
  return decrypt(blinded, privKey);
}

function unblind(sig, pubKey, r){
	let unblinded = modularDivision.modDivide(sig, r, pubKey.N);
	return unblinded;
}

function verify(message, unblinded, pubKey) {
  let m = encrypt(unblinded, pubKey);
  return m + " ===  " + message;
}

//Setting up key pair
let pubKey = { N: 33, e: 3 };
let privKey = { N: 33, d: 7 };
let message = 24;

//blind
let { blinded, r } = blind(message,pubKey);

//sign
let sig = sign(blinded, privKey);

//unblind
let unblinded = unblind(sig, pubKey, r);

//verify
let rs = verify(message, unblinded, pubKey);

console.log("message: "+message);
console.log("blinded: "+blinded);
console.log("r: "+r);
console.log("sig: "+sig);
console.log("unblinded: "+unblinded);
console.log("rs: "+rs);













//console.log(`${m} signed returns signature ${sig}`);
//let b = verify(m, sig, pub);
//console.log(`${sig} ${b ? "is" : "is not" } a valid signature for ${m}`);































