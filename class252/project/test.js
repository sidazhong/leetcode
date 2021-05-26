let time_start = Date.now();
let a = [];
for(let i=0;i<1000000;i++){
  a.push(i);
}
let time_end = Date.now();

const used = process.memoryUsage().heapUsed/1024/1024;
console.log("memory usage: "+used+" MB");
console.log("execution time: "+(time_end-time_start)/1000 +" sec");

