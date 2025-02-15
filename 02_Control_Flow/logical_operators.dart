/*
===========================================
 Topic: Logical Operators in Dart
===========================================
 Logical operators are used to combine multiple conditions in 
 decision-making statements (if, while, etc.).
 
 Dart provides three logical operators:
 1. `&&` (Logical AND)  → Returns true if both conditions are true.
 2. `||` (Logical OR)   → Returns true if at least one condition is true.
 3. `!` (Logical NOT)   → Reverses the boolean value of an expression.
===========================================
*/

void main() {
  // Example 1: Using Logical AND (&&)
  bool isSunny = true;
  bool isWarm = true;

  if (isSunny && isWarm) {
    print("It's a perfect day for a picnic!"); //Output: It's a perfect day for a picnic!
  } else {
    print("Maybe stay indoors today.");
  }

  // Example 2: Using Logical OR (||)
  bool isStudent = true;
  bool hasDiscountCard = false;

  if (isStudent || hasDiscountCard) {
    print("You are eligible for a discount."); //Output: You are eligible for a discount.
  } else {
    print("No discount available.");
  }

  // Example 3: Using Logical NOT (!)
  bool isOnline = false;

  if (!isOnline) {
    print("User is offline."); //Output: User is offline.
  } else {
    print("User is online.");
  }

  // Example 4: Combining Multiple Logical Operators
  int age = 20;
  bool hasLicense = true;
  bool hasInsurance = false;

  if ((age >= 18 && hasLicense) || hasInsurance) { 
    print("You are allowed to drive."); //Output: You are allowed to drive. 
  } else {
    print("You are not allowed to drive.");
  }
}
