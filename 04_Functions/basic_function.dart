/*
===========================================
 Topic: Basic Functions in Dart
===========================================
 Functions are reusable blocks of code that perform a specific task.

 Syntax:
 returnType functionName(parameters) {
   // Function body
   return value;
 }

 Key Points:
 - Dart functions can have parameters and return values.
 - Supports optional and named parameters.
 - Functions improve code reusability and readability.
===========================================
*/

void main() {
  print("Calling basic function:"); //Output: Calling basic function:
  greet(); //Output: Hello, Welcome to Dart!

  print(
      "\nCalling function with parameters:"); //Output: Calling function with parameters:
  print(addNumbers(5, 10)); //Output: 15

  print(
      "\nCalling function with return type:"); //Output: Calling function with return type:
  int square = squareNumber(4);
  print(square); //Output: 16

  print(
      "\nCalling function with optional parameter:"); //Output: Calling function with optional parameter:
  introduce("Azam"); //Output: Hello, my name is Azam and I am 27 years old.
  introduce("Umar", 28); //Output: Hello, my name is Umar and I am 28 years old.

  print(
      "\nCalling function with named parameters:"); //Output: Calling function with named parameters:
  displayInfo(name: "Sohail", age: 26); //Output: Name: Sohail, Age: 26
  displayInfo(age: 40, name: "Harun"); //Output: Name: Harun, Age: 40
}

// Example 1: Simple function without parameters
void greet() {
  print("Hello, Welcome to Dart!"); //Output: Hello, Welcome to Dart!
}

// Example 2: Function with parameters
int addNumbers(int a, int b) {
  return a + b;
}

// Example 3: Function with a return type
int squareNumber(int num) {
  return num * num;
}

// Example 4: Function with an optional parameter
void introduce(String name, [int age = 27]) {
  print("Hello, my name is $name and I am $age years old.");
}

// Example 5: Function with named parameters
void displayInfo({required String name, required int age}) {
  print("Name: $name, Age: $age");
}
