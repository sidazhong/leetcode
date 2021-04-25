
/*
let tmp = a; a = b; b = c; c = d; d = tmp;

let tmp = 
a; a = 
b; b = 
c; c = 
d; d = 
tmp;
*/

syntax rotate = function (ctx) {
	let inCtx = ctx.contextify(ctx.next().value);
	let result = #``;
	
	result = result.concat(#`let tmp = `);
	for (let v of inCtx) {
    result = result.concat(#`${v}; ${v} =`);
    inCtx.next(); // Eating comma
  }
	result = result.concat(#`tmp;`);
	
	return result;
}

var a = 10;
var b = 20;
var c = 30;

// prints a:10 b:20
console.log("a:" + a + " b:" + b + " c:" + c);

rotate (a,b,c);

//prints a:20 b:10
console.log("a:" + a + " b:" + b + " c:" + c);



