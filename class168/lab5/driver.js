"use strict";

let blindSignatures = require('blind-signatures');

let SpyAgency = require('./spyAgency.js').SpyAgency;

function makeDocument(coverName) {
	return `The bearer of this signed document, ${coverName}, has full diplomatic immunity.`;
}

function blind(msg, n, e) {
	return blindSignatures.blind({
		message : msg,
		N : agency.n,
		E : agency.e,
	});
}

function unblind(blindingFactor, sig, n) {
	return blindSignatures.unblind({
		signed : sig,
		N : n,
		r : blindingFactor,
	});
}

let agency = new SpyAgency();

//
// ***YOUR CODE HERE***
//
// Prepare 10 documents with 10 different cover identities (using the
// makeDocument function).
// Blind each of the 10 documents, and remember to store their blinding factors.
//

let coverName = ['Diva','Naga','Kinara','Gandawa','Mahyraga','Ashura','Garuda','Yaksa','karama','darma'];

agency.n = agency.get_n();
agency.e = agency.get_e();

//blind 10 documents
let spy = {
		"origin_documents":[],
		"blinded_documents":[],
		"blinded_factor":[],
}
for(let k in coverName){
	let message = makeDocument(coverName[k]);
	let { blinded, r } = blind(message,agency.get_n(),agency.get_e());
	
	spy.origin_documents[k]=message;
	spy.blinded_documents[k]=blinded;
	spy.blinded_factor[k]=r;
}

let blindDocs = spy.blinded_documents;

agency.signDocument(blindDocs, (selected, verifyAndSign) => {
  //
  // ***YOUR CODE HERE***
  //
  // The 'signDocument' function takes a callback function, which
  // specifies which of the 10 documents the spy agency will sign.
  //
  // You must call the 'verifyAndSign' function, specifying arrays with:
  // 1) the blinding factors
  // 2) the original documents
  //
  // Note that you should specify this information for all documents
  // EXCEPT the specified document. (In the selected position, set
  // these positions to 'undefined'.)
  //
  // The verifyAndSign function will return the blinded signature.
  // Unblind it, and make sure that the signature is valid for
  // the selected document.
	let selected_blinded_factor = spy.blinded_factor[selected];
	let selected_origin_documents = spy.origin_documents[selected];
	
	//remove the selected one
	spy.blinded_factor[selected] = undefined;
	spy.origin_documents[selected] = undefined;
	
	//sign all documents except the the specified document
	let sig = verifyAndSign(spy.blinded_factor,spy.origin_documents);
	
	//unblind
	let unblinded = unblind(selected_blinded_factor,sig,agency.n);
	
	//verify
	let result = blindSignatures.verify({
	  unblinded: unblinded,
	  N: agency.n,
	  E: agency.e,
	  message: selected_origin_documents,
	});
	
	console.log(result);
});
























































