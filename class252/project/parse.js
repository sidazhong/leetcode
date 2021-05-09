let time_start = Date.now();

let fs = require('fs')
let $json = fs.readFileSync('100mb.json', 'utf8')
let $obj = JSON.parse($json);
console.log(typeof $obj);

let time_end = Date.now();
const used = process.memoryUsage().heapUsed ;
console.log(used);
console.log((time_end-time_start)/1000);