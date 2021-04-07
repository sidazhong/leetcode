console.log("test");

/*
 * 
Object-oriented programming in JavaScript.
Create a 'Student' constructor, like we did for Cat in class.
It should have the following fields:
firstName
lastName
studentID
display -- A function that prints out the firstName, lastName, and studentID number.
To invoke it, you should call `student.display()`.
 */
function Student (firstname,lastname,studentID){
	this.firstname=firstname;
	this.lastname=lastname;
	this.studentID=studentID;
	this.display=function (){console.log(this.firstname+", "+this.lastname+", "+this.studentID+", "+this.graduated)}
}

//Create an array of new students.
students = [new Student("sida","zhong","123"),
						new Student("peilu","liu","456"),
						new Student("yan","chen","789")]

//Add a 'graduated' property to just one of your students.
students[0].graduated=1;

//Now create another student **without** using the constructor. 
//(In other words, use the object literal `{}` syntax).
//Make sure the display method still works (without you having to add it to the object explicitly).
testStudent = {"firstname":"testF","lastname":"testL","studentID":"1234567890"}
testStudent.__proto__.display=students[0].display;

students[0].display();
students[1].display();
students[2].display();
testStudent.display();































