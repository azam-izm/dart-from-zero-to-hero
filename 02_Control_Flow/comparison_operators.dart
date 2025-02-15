/*
===========================================
 Topic: Comparison Operators in Dart
===========================================
 Comparison operators are used to compare two values and return a boolean result (true or false).

 Dart provides the following comparison operators:
 1. `==`  → Equal to (Checks if two values are equal)
 2. `!=`  → Not equal to (Checks if two values are not equal)
 3. `>`   → Greater than (Checks if the left operand is greater)
 4. `<`   → Less than (Checks if the left operand is smaller)
 5. `>=`  → Greater than or equal to
 6. `<=`  → Less than or equal to
===========================================
*/

void main() {
  int a = 10;
  int b = 20;

  // Example 1: Equal to (==)
  print("Is a equal to b? ${a == b}"); // false

  // Example 2: Not equal to (!=)
  print("Is a not equal to b? ${a != b}"); // true

  // Example 3: Greater than (>)
  print("Is a greater than b? ${a > b}"); // false

  // Example 4: Less than (<)
  print("Is a less than b? ${a < b}"); // true

  // Example 5: Greater than or equal to (>=)
  print("Is a greater than or equal to b? ${a >= b}"); // false

  // Example 6: Less than or equal to (<=)
  print("Is a less than or equal to b? ${a <= b}"); // true

  // Example 7: Using comparison in a conditional statement
  if (a < b) {
    print("a is smaller than b."); //a is smaller than b.
  } else {
    print("a is greater than or equal to b.");
  }

  // Example 8: Comparison with Strings
  String name1 = "Azam";
  String name2 = "Umar";

  print("Is name1 equal to name2? ${name1 == name2}"); // false
  print("Is name1 not equal to name2? ${name1 != name2}"); // true
}
