let time_start = Date.now();

let a = [];
for(let i=0;i<1000000;i++){
  a.push(['a','b','c','d','e','f','g']);
}

let time_end = Date.now();

const used = process.memoryUsage().heapUsed/1024/1024;
console.log(used+" MB");
console.log((time_end-time_start)/1000 +" sec");


