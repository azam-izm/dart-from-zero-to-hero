/*
===========================================
 Topic: do-while Loop in Dart
===========================================
 The `do-while` loop is an exit-controlled loop in Dart.
 It ensures that the loop body executes at least once before checking the condition.

 Syntax:
 do {
   // Code to execute
 } while (condition);

 Key Points:
 - The loop runs at least once, regardless of the condition.
 - The condition is checked after executing the loop body.
 - Used when we want to execute something before validation.
===========================================
*/

import 'dart:io';

void main() {
  int number;
  bool isValid = false;

  print("Welcome to the Positive Number Validator!");

  do {
    // Prompt the user for input
    print("Please enter a positive number:");

    // Read user input
    String? input = stdin.readLineSync();

    // Try to parse the input as an integer
    try {
      number = int.parse(input!);

      // Check if the number is positive
      if (number > 0) {
        isValid = true; // Exit the loop if the number is valid
        print("Great! You entered a valid positive number: $number");
      } else {
        print("Oops! The number must be greater than 0. Try again.");
      }
    } catch (e) {
      // Handle invalid input (non-integer values)
      print("Invalid input. Please enter a valid number.");
    }
  } while (!isValid); // Repeat until a valid positive number is entered

  print("Thank you for using the Positive Number Validator!");
}

