/*
===========================================
 Topic: Null Coalescing Operator in Dart
===========================================
 The null coalescing operator (`??`) is used to handle null values efficiently.
 It provides a default value when a variable is null.

 Dart provides two null coalescing operators:
 1. `??`  → Returns the left operand if it's not null; otherwise, returns the right operand.
 2. `??=` → Assigns a value only if the variable is null.
===========================================
*/

void main() {
  // Example 1: Using ?? to provide a default value
  String? name;
  print("Name: ${name ?? "Guest"}"); // Output: Name: Guest

  name = "Azam";
  print("Name: ${name ?? "Guest"}"); // Output: Name: Azam

  // Example 2: Using ??= to assign a value only if it's null
  int? age;
  age ??= 27; // Assigns 27 because age is null
  print("Age: $age"); // Output: Age: 27

  age ??= 30; // Doesn't assign because age is already 27
  print("Age: $age"); // Output: Age: 27

  // Example 3: Using ?? with user input (simulated)
  String? userInput;
  String result = userInput ?? "Default Value";
  print("User Input: $result"); // Output: User Input: Default Value

  // Example 4: Using ?? in function parameters
  greetUser(null); //Output: Hello, Guest!
  greetUser("Azam"); //Output: Hello, Azam!
}

void greetUser(String? name) {
  print("Hello, ${name ?? "Guest"}!");
}
