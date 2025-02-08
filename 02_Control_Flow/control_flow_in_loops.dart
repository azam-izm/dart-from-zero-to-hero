/*
===========================================
Topic: Control Flow in Loops in Dart
===========================================
Control flow statements like `break`, `continue`, and `return` can be used within loops to alter the normal execution flow. These control statements help in handling complex conditions inside loops.

1. `break`: Exits only the loop and continues with the rest of the code after the loop.
2. `continue`: Skips the current iteration and proceeds to the next iteration of the loop.
3. `return`: Exits both the loop and the entire function.

===========================================
*/

void main() {
  // Example 1: Using 'break' to exit the loop early
  print("Using break:");
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      break; // Exits the loop when i is 3
    }
    print(i);
  }
  // Output: 0 1 2

  // Example 2: Using 'continue' to skip an iteration
  print("\nUsing continue:");
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      continue; // Skips this iteration when i is 3
    }
    print(i);
  }
  // Output: 0 1 2 4

  // Example 4: Nested loops with control flow
  print("\nNested loop with break:");
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (i == 1 && j == 1) {
        break; // Breaks out of inner loop when i=1 and j=1
      }
      print("i: $i, j: $j");
    }
  }
  // Output: i: 0, j: 0 i: 0, j: 1 i: 0, j: 2
  //         i: 1, j: 0

  // Example 4: Using 'return' to exit the loop and function
  print("\nUsing return:");
  print(findEvenNumber());
  // Output: First even number found: 2
}

String findEvenNumber() {
  List<int> numbers = [1, 3, 5, 2, 7];
  for (int num in numbers) {
    if (num.isEven) {
      return "First even number found: $num";
    }
  }
  return "No even number found";
}
