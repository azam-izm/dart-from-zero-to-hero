/*
===========================================
 Topic: break and continue in Dart
===========================================
 The `break` and `continue` statements are used to control loop execution.

 1. `break`: Exits the loop immediately when encountered.
 2. `continue`: Skips the current iteration and moves to the next one.

 These statements are mostly used in loops such as `for`, `while`, and `do-while`.
===========================================
*/

void main() {
  // Example 1: Using break to stop a loop when a condition is met
  print("Using break:"); //Output: Using break:
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print("Breaking at $i"); //Output: Breaking at 3
      break; // Stops loop when i == 3
    }
    print(i); //Output: 1, 2
  }

  print("\nUsing continue:"); //Output: Using continue:
  // Example 2: Using continue to skip a specific iteration
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print("Skipping $i"); //Output: Skipping 3
      continue; // Skips iteration when i == 3
    }
    print(i); //Output: 1, 2, 4, 5
  }

  print("\nBreak in while loop:"); //Output: Break in while loop:
  // Example 3: Using break in a while loop
  int num = 1;
  while (num <= 5) {
    if (num == 4) {
      print("Breaking at $num"); //Output: Breaking at 4
      break;
    }
    print(num); //Output: 1, 2, 3
    num++;
  }

  print("\nContinue in while loop:"); //Output: Continue in while loop:
  // Example 4: Using continue in a while loop
  num = 0;
  while (num < 5) {
    num++;
    if (num == 2) {
      print("Skipping $num"); //Output: Skipping 2
      continue;
    }
    print(num); //Output: 1, 3, 4, 5
  }
}
