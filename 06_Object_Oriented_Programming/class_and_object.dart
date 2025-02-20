/*
===========================================
 Topic: Class and Object in Dart
===========================================
 - This program demonstrates the concept of classes and objects.
 - Key Points:
   ✅ Creating a class with properties and methods.
   ✅ Creating an object of the class.
   ✅ Accessing properties and methods using the object.
===========================================
*/

// 1️⃣ Defining a Class
class Person {
  // Class properties (attributes)
  String name;
  int age;

  // Constructor to initialize properties
  Person(this.name, this.age);

  // Method to display person's details
  void displayInfo() {
    print("Name: $name, Age: $age"); //Output: Name: Azam, Age: 27
  }
}

// 2️⃣ Main Function to Demonstrate Object Creation
void main() {
  // Creating an Object of the Person class
  Person person1 = Person("Azam", 27);

  // Accessing the object's properties
  print("Person's Name: ${person1.name}"); //Output: Person's Name: Azam
  print("Person's Age: ${person1.age}"); //Output: Person's Age: 27

  // Calling the method using the object
  person1.displayInfo();
}

/*
What is a Class?
A class is a blueprint or template for creating objects. It defines the properties (attributes) and 
behaviors (methods) that the objects created from the class will have.

What is an Object?
An object is an instance of a class. When you create an object, you are creating a specific example of 
the class with its own unique data. For example, if Person is a class, then person1 (with the name "Azam" 
and age 27) is an object of that class.

What is a Constructor?
A constructor is a special method in a class that has the same name as the class. It is automatically 
called when an object is created, acting as a bridge between the class and the object. Without a 
constructor, we cannot create objects. Its primary purpose is to initialize the properties of the object 
when it is created.
*/
