"use strict";
const BlindSignature = require('blind-signatures');

function encrypt(message, pubKey) {
  let ciphertext = message ** pubKey.e % pubKey.N;
  return ciphertext;
}

function decrypt(ciphertext, privKey) {
  let message = ciphertext ** privKey.d % privKey.N;
  return message;
}

function sign(blinded, privKey) {
  return decrypt(blinded, privKey);
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
let { blinded, r } = BlindSignature.blind({
  message: message.toString(),
  N: pubKey.N.toString(),
  E: pubKey.e.toString(),
}); 


//sign
let sig = sign(blinded, privKey);

//unblind
const unblinded = BlindSignature.unblind({
  signed: sig,
  N: pubKey.N.toString(),
  r: r,
}); 

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































