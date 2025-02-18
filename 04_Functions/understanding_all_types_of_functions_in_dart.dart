/*
===========================================
 Topic: Understanding All Types of Functions in Dart
===========================================

Functions in Dart are reusable blocks of code that perform specific tasks. A function consists of:

1. Return Type: Specifies the type of value the function will return. If no value is returned, `void` 
is used. - Example: `String`, `int`, `void`, etc.
   
2. Function Name: A unique identifier for the function, following the lowerCamelCase naming convention.
   - Example: `greetUser`, `addNumbers`, etc.

3. Parameters: Input values to the function, defined inside the parentheses. Multiple parameters are 
separated by commas. -Example: `String name`, `int age`, etc.
   
4. Function Body: The code block inside braces `{}` that defines the actions the function performs.
   - Example: Code that executes when the function is called.

The return type, function name and parameters are collectively known as the function
signature. the code between the braces is known as the function body

In this lecture, we will explore the following types of functions in Dart:
1. Basic Functions
2. Function Return Values
3. Arrow Functions
4. Recursive Functions
5. Higher-Order Functions
6. Async and Future Functions
7. Stream Functions

Each of these types is explained with examples, comments, and use cases to enhance your understanding of 
Dart functions. 

Author: Muhammad Azam
*/

// ======================================
// 1. Basic Functions
// ======================================

void greet() { // Simple function that prints a greeting message
  print("Hello, Welcome to Dart!");
}

int addNumbers(int a, int b) { // Function with parameters that adds two numbers
  return a + b;
}

int squareNumber(int num) { // Function with a return type that returns the square of a number
  return num * num;
}

void introduce(String name, [int age = 27]) { // Function with an optional positional parameter. If age is not provided, default value 27 is used
  print("Hello, my name is $name and I am $age years old.");
}

void displayInfo({required String name, required int age}) { // Function with required named parameters. Named parameters must be passed with their labels
  print("Name: $name, Age: $age");
}

// ======================================
// 2. Function Return Values
// ======================================

int add(int a, int b) { // Function that returns an integer value
  return a + b;
}

String greetUser(String name) { // Function that returns a string value
  return "Hello, $name!";
}

bool isEven(int number) { // Function that returns a boolean value
  return number % 2 == 0;
}

List<int> getNumbers() { // Function that returns a list
  return [1, 2, 3, 4, 5];
}

Map<String, dynamic> getUserInfo(String name, int age) { // Function that returns a map
  return {"name": name, "age": age};
}

Function getMultiplier(int factor) { // Higher-order function that returns a function
  return (int number) => number * factor; // This is an example of a function that returns another function
} 

/*
======================================
3. Arrow Functions
======================================
Arrow Functions (also called Fat Arrow Functions) are a shorthand way of defining simple functions. 
They are particularly useful when you need to write a function with a single expression.

Features of Arrow Functions:
1. No need for a return type   (2) Used with a single expression  (3) No curly braces

Arrow functions are useful in scenarios where a simple, single-expression function is needed, such as 
when using higher-order functions or callbacks.
*/

int sumArrow(int a, int b) => a + b; // Arrow function for adding two numbers

bool isEvenArrow(int number) => number % 2 == 0; // Arrow function to check even number

String greetUserArrow(String name) => "Hello, $name!"; // Arrow function to greet user

List<int> getNumbersArrow() => [1, 2, 3, 4, 5]; // Arrow function returning a list

Map<String, dynamic> getUserInfoArrow(String name, int age) => {"name": name, "age": age}; // Arrow function returning a map

/*
======================================
4. Recursive Functions
======================================
Recursive Functions are functions that call themselves in order to solve a problem. They are typically 
used to break down complex problems into simpler subproblems.

Features of Recursive Functions:
1. Function calls itself within its body.
2. Must have a base case to stop the recursion, preventing infinite loops.
3. Useful for problems that can be divided into smaller, similar problems, like calculating factorials or 
Fibonacci series.

Recursive functions are ideal for problems that involve repetitive, self-similar tasks, such as 
tree traversal, factorial calculation, etc.
*/

int factorial(int n) {
  // Recursive function to calculate factorial of a number
  if (n <= 1) {
    return 1; // Base case: factorial of 0 or 1 is 1
  } else {
    return n * factorial(n - 1); // Recursive call
  }
}

/*
======================================
5. Higher-Order Functions
======================================
Higher-Order Functions are functions that either take one or more functions as arguments, return a function, 
or do both. 

Higher-order functions are functions that can accept other functions as arguments or return functions 
as results. These functions make your code more flexible and reusable by allowing you to pass different 
behaviors (functions) into them.

For example, functions like map(), reduce(), and where() are common higher-order functions. They let you:

Transform a list of items (using map()).
Combine a list of items into one (using reduce()).
Filter a list of items based on certain criteria (using where()).
*/

List<int> numbers = [1, 2, 3, 4, 5];
var doubledNumbers = numbers.map((num) => num * 2).toList(); // Using a higher-order function `map()` to transform the list

// Using a higher-order function `reduce()` to accumulate values
var sum = numbers.reduce((a, b) => a + b);

// Using a higher-order function `where()` to filter the list
var evenNumbers = numbers.where((num) => num.isEven).toList();

// Custom higher-order function that accepts a function as an argument
int performOperation(int a, int b, int Function(int, int) operation) {
  return operation(a, b); // Executes the passed function (multiplication in this case)
}

/*
======================================
6. Async and Future Functions
======================================
Async and Future functions are used for handling asynchronous operations in Dart. An asynchronous function 
allows the program to perform tasks that take time (such as network requests or file I/O) without blocking 
the main thread.

Features:
1. `async` keyword: Marks a function as asynchronous.
2. `await` keyword: Pauses the function's execution until the awaited task completes.
3. `Future`: Represents a value that will be available at some point in the future.

Async and Future functions are essential for performing non-blocking operations, such as fetching data 
from an API, loading files, or waiting for user input, improving the efficiency and responsiveness 
of your app.
*/

Future<void> fetchData() async { // Async function that returns a Future
  await Future.delayed(Duration(seconds: 2)); // Simulating a delay
  print("Data fetched: Hello from the future!");
}

/*
======================================
7. Stream Functions
======================================
Stream functions are used to handle a sequence of asynchronous events or data over time. Streams are like 
futures, but instead of a single value, they provide a series of values. They are useful for scenarios where data arrives over time, 
like user input, network responses, or real-time data.

Features:
1. `Stream`: Represents a series of asynchronous events.
2. `await for`: Used to listen for events in a stream.
3. `StreamController`: Used to create and manage a stream manually.

Stream functions help manage continuous or multiple asynchronous data sources efficiently, allowing your 
app to handle events as they occur without blocking the main thread.
*/

Stream<int> getStreamData() async* { // Stream function that generates values asynchronously
  for (int i = 1; i <= 4; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1)); // Simulating a delay
  }
}

void awaitStreamData() async { // Function to await and print data from Stream
  await for (var data in getStreamData()) {
    print("Stream Data: $data");
  }
}

void main() {
  // ====================
  // 1. Basic Functions
  // ====================
  print("Calling basic function:");
  greet(); // Output: Hello, Welcome to Dart!

  // Function with parameters
  print("\nCalling function with parameters:");
  print(addNumbers(5, 10)); // Output: 15

  // Function with return type
  print("\nCalling function with return type:");
  int square = squareNumber(4);
  print(square); // Output: 16

  // Function with optional parameter
  print("\nCalling function with optional parameter:");
  introduce("Azam"); // Output: Hello, my name is Azam and I am 27 years old.
  introduce("Umar", 28); // Output: Hello, my name is Umar and I am 28 years old.

  // Function with named parameters
  print("\nCalling function with named parameters:");
  displayInfo(name: "Sohail", age: 26); // Output: Name: Sohail, Age: 26
  displayInfo(age: 30, name: "Ali"); // Output: Name: Ali, Age: 30

  // ====================
  // 2. Function Return Values
  // ====================
  print("\nCalling function that returns an integer:");
  int sum = addNumbers(5, 10);
  print(sum); // Output: 15

  print("\nCalling function that returns a string:");
  print(greetUser("Azam")); // Output: Hello, Azam!

  print("\nCalling function that returns a boolean:");
  print(isEven(8)); // Output: true
  print(isEven(7)); // Output: false

  print("\nCalling function that returns a list:");
  print(getNumbers()); // Output: [1, 2, 3, 4, 5]

  print("\nCalling function that returns a map:");
  print(getUserInfo("Azam", 27)); // Output: {name: Azam, age: 27}

  print("\nCalling function that returns another function:");
  var multiplier = getMultiplier(3);
  print(multiplier(4)); // Output: 12

  // ====================
  // 3. Arrow Functions
  // ====================
  print("\nCalling arrow function that returns sum:");
  print(sumArrow(5, 10)); // Output: 15

  print("\nCalling arrow function that checks even number:");
  print(isEvenArrow(8)); // Output: true
  print(isEvenArrow(7)); // Output: false

  print("\nCalling arrow function that returns a greeting:");
  print(greetUserArrow("Azam")); // Output: Hello, Azam!

  print("\nCalling arrow function that returns a list:");
  print(getNumbersArrow()); // Output: [1, 2, 3, 4, 5]

  print("\nCalling arrow function that returns a map:");
  print(getUserInfoArrow("Azam", 27)); // Output: {name: Azam, age: 27}

  // ====================
  // 4. Recursive Functions
  // ====================
  print("\nCalling recursive function for factorial:");
  print(factorial(5)); // Output: 120

  // ====================
  // 5. Higher-Order Functions
  // ====================
  print("\nCalling higher-order function:");
  print(doubledNumbers); // Output: [2, 4, 6, 8, 10]
  print(sum); // Output: 15
  print(evenNumbers); // Output: [2, 4]

  var result =  performOperation(5, 3, (a, b) => a * b); // Custom higher-order function
  print(result); // Output: 15

  // ====================
  // 6. Async and Future Functions
  // ====================
  print("\nCalling async function with Future:");
  fetchData(); // Output: Data fetched: Hello from the future!

  // ====================
  // 7. Stream Functions
  // ====================
  print("\nCalling async Stream function:");
  awaitStreamData(); // Output: Stream Data: 1, Stream Data: 2, Stream Data: 3, Stream Data: 4
}
