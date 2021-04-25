let rabbitName:string = "Monty";
function Rabbit(newname) {
  this.rabbitName = newname;
}
let r:string = new Rabbit("Python");
console.log(rabbitName);    // Prints "Python"


