/*
  Topic: variables_and_data_types.dart
  Description: This lesson demonstrates the declaration and usage of different types of variables in Dart.
               It covers all fundamental data types and explains their usage with examples.
*/

void main() {
  // Integer type variable (int)
  int age = 25;
  print("Age: $age");

  // Double type variable (double) for decimal values
  double price = 99.99;
  print("Price: \$${price}");

  // String type variable (String)
  String name = "John Doe";
  print("Name: $name");

  // Boolean type variable (bool)
  bool isStudent = false;
  print("Is Student: $isStudent");

  // Dynamic type variable (dynamic) - can hold any type of value
  dynamic flexibleVar = "This is a string";
  print("Dynamic Variable (String): $flexibleVar");
  flexibleVar = 42; // Now holding an integer
  print("Dynamic Variable (Integer): $flexibleVar");

  // Final and Const variables (Immutable variables)
  final currentTime = DateTime.now(); // Assigned at runtime
  print("Current Time: $currentTime");

  const pi = 3.1416; // Assigned at compile-time
  print("Value of Pi: $pi");
}

/*
  Explanation:
  1. `int`: Used for whole numbers (e.g., 1, 100, -50).
  2. `double`: Used for decimal numbers (e.g., 3.14, -0.99, 2.0).
  3. `String`: Used for textual data, enclosed in single or double quotes.
  4. `bool`: Used for Boolean values (true/false).
  5. `dynamic`: A variable that can hold any type of value and change its type at runtime.
  6. `final`: A variable that can be assigned only once and is determined at runtime.
  7. `const`: A compile-time constant whose value must be known at compile time.

  Additional Notes:
  - String interpolation is done using `$variable` or `${expression}`.
  - Dart is strongly typed, but `dynamic` allows flexibility.
*/