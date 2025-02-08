/*
===========================================
Topic: For Loop in Dart
===========================================
The `for` loop is used to repeatedly execute a block of code a fixed number of times. It's one of the most commonly used loops in Dart for iterating over a range or list.

Syntax:
  for (initialization; condition; increment/decrement) {
    // code to be executed
  }

1. `initialization`: The starting point, typically used to define and initialize the loop variable.
2. `condition`: The condition that is checked before every iteration. The loop continues as long as the condition is true.
3. `increment/decrement`: The step to be taken after each iteration (increasing or decreasing the loop variable).

===========================================
*/
import 'dart:io';

void main() {
  // Example 1: Basic for loop
  print("Basic for loop:");
  for (int i = 0; i < 5; i++) {
    print(i); // Output: 0 1 2 3 4
  }

  // Example 2: Using for loop with a list
  List<String> fruits = ["Apple", "Banana", "Cherry"];
  print("\nUsing for loop with a list:");
  for (int i = 0; i < fruits.length; i++) {
    print(fruits[i]); // Output: Apple Banana Cherry
  }

  // Example 3: Reverse iteration with for loop
  print("\nReverse iteration:");
  for (int i = 4; i >= 0; i--) {
    print(i); // Output: 4 3 2 1 0
  }

  // Example 4: Using for loop with multiple variables (nested loops)
  print("\nNested for loops:");
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 2; j++) {
      print(
          "i: $i, j: $j"); // Output: i: 0, j: 0 i: 0, j: 1 i: 1, j: 0 i: 1, j: 1 i: 2, j: 0 i: 2, j: 1
    }
  }

  // Example 5: Using a for loop with step value (increment by 2)
  print("\nFor loop with step value:");
  for (int i = 0; i < 10; i += 2) {
    print(i); // Output: 0 2 4 6 8
  }

  // Example 6: Table of 5 using for loop
  print("\nTable of 5:");
  for (int i = 1; i <= 10; i++) {
    print("5 x $i = ${5 * i}");
    // Output: 5 x 1 = 5 5 x 2 = 10 5 x 3 = 15 ... 5 x 10 = 50
  }

  // Example 7: For loop to calculate the sum of numbers in a range
  int sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
  }
  print("\nSum of numbers from 1 to 10 is: $sum"); // Output: 55

  // Example 8: For loop to find even numbers in a range
  print("\nEven numbers between 1 and 20:");
  for (int i = 2; i <= 20; i += 2) {
    print(i); // Output: 2 4 6 8 10 12 14 16 18 20
  }

  // Example 9: For loop with a condition inside to break early
  print("\nFind first number divisible by 3 between 1 and 50:");
  for (int i = 1; i <= 50; i++) {
    if (i % 3 == 0) {
      print(i); // Output: 3 (and stops)
      break;
    }
  }

// Example 10: For loop to print a multiplication table in a grid format
  print("\nPrinting a multiplication table (1-10) in a grid format:");
  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      // Printing each cell in the grid with the product of i and j
      stdout.write("${i * j}\t"); // Use stdout.write to print without a newline
    }
    print(""); // Moves to the next line after each row
  }
}
