/*
  Topic: Input and Output in Dart
  Description: This topic covers how to take user input and display output in Dart.
               It includes standard console output and user input handling.
*/

import 'dart:io'; // Required for taking user input

void main() {
  // Printing output using print() function
  print("Enter your name:");
  
  // Taking user input from the console
  String? name = stdin.readLineSync();
  
  // Displaying user input
  print("Hello, $name!");

  // Taking integer input
  print("Enter your age:");
  String? ageInput = stdin.readLineSync();
  int? age = int.tryParse(ageInput ?? '0'); // Converting string to integer safely
  
  // Displaying age
  print("Your age is: $age");
}

/*
  Explanation:
  1. `print()`: Used to display output on the console.
  2. `stdin.readLineSync()`: Reads a line of text from the user input as a string.
  3. `String?`: The question mark (?) means the variable can hold a null value.
  4. `int.tryParse()`: Converts a string to an integer safely to avoid errors.
  5. `import 'dart:io';`: Required to use input-related functions in Dart.

  Additional Notes:
  - Always validate user input to prevent runtime errors.
  - If no input is provided, `stdin.readLineSync()` returns `null`, so using `??` (null coalescing operator) ensures safety.
*/