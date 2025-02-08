/*
  Topic: const_and_final.dart
  Description: This lesson explains the differences between `const` and `final` in Dart, emphasizing the three main distinctions and demonstrating how to use both types of variables with detailed explanations.
*/

void main() {
  // (1) 'final' - Variable assigned only once at runtime
  final String greeting;
  greeting = "Hello, Dart!";
  print(greeting); 

  // Uncommenting the following line will cause a compile-time error:
  // greeting = "Hello, World!"; // Error: The final variable 'greeting' can only be set once.

  // 'const' - Value must be known at compile-time
  const double pi = 3.1416;
  print("Value of Pi: $pi");

  // Uncommenting the following line will cause a compile-time error:
  // pi = 3.14; // Error: A const variable can't be assigned a new value.

  // (2) 'final' with non-constant variable assignment
  final nonFinalVariable =
      pi; // pi is constant, but can be assigned to final variable
  print("Non Final Variable: $nonFinalVariable");

  // Uncommenting the following line will cause a compile-time error:
  // const nonConstVariable = greeting; // Error: Const variables must be initialized with constant values.

  // (3) Modifying data in final list but not reassigned reference
  final List<String> myDays = ['Monday', 'Tuesday', 'Wednesday'];
  print("My days list: $myDays");

  // Cannot reassign the list reference, will cause an error:
  // myDays = ['New Day']; // Error: Cannot assign to a final variable.

  // Can modify the content of the list (add or remove items):
  myDays.add('Thursday');
  print("Modified list: $myDays");

  myDays.remove('Wednesday');
  print("Modified list: $myDays");

  // 'const' list that cannot be modified
  const List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  print("Days of the week: $daysOfWeek");

  // Uncommenting the following lines will cause errors because a const list is immutable:
  // daysOfWeek = ['New Day']; // Error: Constant variables can't be assigned a new value.
  // daysOfWeek.add('Thursday'); // Error: Cannot modify a const list.
  // daysOfWeek.remove('Wednesday'); // Error: Cannot modify a const list.
}

/*
  Explanation:

  1. `final`:
     - A variable declared with `final` can be assigned only once, but the value is determined at runtime.
     - It can be initialized with other variables, e.g., `final nonFinalVariable = pi;` where `pi` is a const.
     - The value can be modified if it’s a mutable object (like a list), but the final variable itself cannot be reassigned.

  2. `const`:
     - A variable declared with `const` must be initialized with a compile-time constant.
     - Once assigned, the value and the reference are immutable. You cannot change the value or reassign the variable.
     - It cannot be initialized with non-constant variables, and it requires the value to be a compile-time constant.

  3. Key Differences:
     - `final` allows assignment at runtime and is more flexible, while `const` requires compile-time constants and provides stricter immutability.
     - You can modify data inside a `final` variable (like adding items to a list), but you cannot reassign the variable itself.
     - `const` variables are fully immutable, meaning both the value and reference are fixed.

  Additional Notes:
  - Both `final` and `const` variables cannot be reassigned once initialized. However, `const` is stricter because it also prevents modification of the reference itself.
*/
