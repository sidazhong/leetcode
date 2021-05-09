// NOTE: This library uses non-standard JS features (although widely supported).
// Specifically, it uses Function.name.

function any(v) {
  return true;
}

function isNumber(v) {
  return !Number.isNaN(v) && typeof v === 'number';
}
isNumber.expected = "number";

//
// ***YOUR CODE HERE***
// IMPLEMENT THE FOLLOWING CONTRACTS
//
function isBoolean(v){
	return typeof v === 'boolean';
}
isBoolean.expected = "boolean";

function isDefined(v){
	return v !== null && typeof v !== 'undefined';
}
isDefined.expected = 'defined';

//Using toString() to detect object class
//Using call() to chain constructors for an object
function isString(v){
	return (Object.prototype.toString.call(v) === '[object String]') || typeof v === 'string';
}
isString.expected = 'string';

function isNegative(v){
	return isNumber(v) && v<0;
}
isNegative.expected = 'negative number';


function isPositive(v){
	return isNumber(v) && v>0;
}
isPositive.expected = 'positive number';


// Combinators:

function and() {
  let args = Array.prototype.slice.call(arguments);
  //console.log(args);
  
  //it takes a variable number of contracts and returns true only if all of the original contracts return true
  let cont = function(v) {
  	//console.log(v);	// 42
    for (let i in args) {
    	//console.log(args[i].call(this, v)); //true
      if (!args[i].call(this, v)) {
        return false;
      }
    }
    return true;
  }
  cont.expected = expect(args[0]);
  for (let i=1; i<args.length; i++) {
    cont.expected += " and " + expect(args[i]);
  }
  return cont;
}

//
// ***YOUR CODE HERE***
// IMPLEMENT THESE CONTRACT COMBINATORS
//=================================================================================================================
function or(){
	let args = Array.prototype.slice.call(arguments);
  //Takes a variable number of contracts; returns true if any of the original contracts return true.
  let cont = function(v) {
    for (let i in args) {
      if (args[i].call(this, v)) {
        return true;
      }
    }
    return false;
  }
  cont.expected = expect(args[0]);
  for (let i=1; i<args.length; i++) {
    cont.expected += " or " + expect(args[i]);
  }
  return cont;
};

//=================================================================================================================
function not(){
	let args = Array.prototype.slice.call(arguments);
	//Takes a single contract; returns a contract that returns true only if the original contract returns false.
	let cont = function(v) {
		return !args[0].call(this, v);
	}
  cont.expected = "not "+expect(args[0]);
  return cont;
};



// Utility function that returns what a given contract expects.
function expect(f) {
  // For any contract function f, return the "expected" property
  // if it is specified.  (This allows developers to specify what
  // the expected property should be in a more readable form.)
  if (f.expected) {
    return f.expected;
  }
  // If the function name is available, use that.
  if (f.name) {
    return f.name;
  }
  // In case an anonymous contract is specified.
  return "ANONYMOUS CONTRACT";
}


//April 19th recording 
//https://sjsu.zoom.us/rec/play/x20bS60WW_np3TKzOL77JpeIXyeVnbYyj2P6j0XQO3vyHZBKKqtTQJHjuxfe4TyJdxobL3JXueoypwLa.wzVZh6PQlLPRue8f?continueMode=true&_x_zm_rtaid=19Z4aAOtRpixVnH5nouP2Q.1619412831063.ad94adfa9cf40679026ee54021158f31&_x_zm_rhtaid=860
//6Cy5HMu.
function contract (preList, post, f) {
	let handler = {
	  apply: function(thisFunc, thisObj, thisArg) {
	  	//check preList
			for (let k in thisArg) {
				let check_preList = preList[k].call(thisObj,thisArg[k]);
				if(!check_preList){
					throw {"message":"Contract violation in position " + k +". Expected "+preList[k].expected+" but received "+ thisArg[k] +".  Blame -> Top-level code"};
				}
			}
			
			//check
	 		let check_post = thisFunc.apply(thisObj,thisArg);
			if(!post(check_post)){
				throw {"message":"Contract violation. Expected "+post.expected+" but returned " + check_post + ". Blame -> " + f.name};
			}
			
			//pass
			return check_post;
	  }
	};

	let proxyF = new Proxy(f, handler);
	return proxyF;
}

module.exports = {
  contract: contract,
  any: any,
  isBoolean: isBoolean,
  isDefined: isDefined,
  isNumber: isNumber,
  isPositive: isPositive,
  isNegative: isNegative,
  isInteger: Number.isInteger,
  isString: isString,
  and: and,
  or: or,
  not: not,
};



























