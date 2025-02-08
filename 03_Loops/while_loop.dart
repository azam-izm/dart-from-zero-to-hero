/*
===========================================
Topic: While Loop in Dart
===========================================
The `while` loop is used to execute a block of code as long as a specified condition is true. It is useful when the number of iterations is not known beforehand.

Syntax:
  while (condition) {
    // code to be executed
  }

1. `condition`: The condition that is checked before every iteration. The loop continues as long as the condition is true.

**Key Point**: If the condition is false at the very first check, the loop body will not execute at all.
===========================================
*/

void main() {
  // Example 1: Basic while loop
  print("Basic while loop:");
  int i = 0;
  while (i < 5) {
    print(i); // Output: 0 1 2 3 4
    i++;
  }

  // Example 2: Using while loop with a list
  print("\nUsing while loop with a list:");
  List<String> animals = ["Cat", "Dog", "Elephant"];
  int index = 0;
  while (index < animals.length) {
    print(animals[index]); // Output: Cat Dog Elephant
    index++;
  }

  // Example 3: Using while loop with a condition to find a specific element in a list
  print("\nSearching for a specific value in the list:");
  List<int> numbers = [3, 7, 1, 9, 4];
  int target = 9;
  int idx = 0;
  bool found = false;

  while (idx < numbers.length) {
    if (numbers[idx] == target) {
      found = true;
      break; // Exits the loop once the target is found
    }
    idx++;
  }
  if (found) {
    print("Found target $target at index $idx");
  } else {
    print("Target not found.");
  }
}
