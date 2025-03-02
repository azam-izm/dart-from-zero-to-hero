/*
===========================================
 Topic: Comprehensive Error Handling in Dart:
         try, catch, on, finally, throw, and rethrow
===========================================
 This lecture demonstrates how Dart allows you to gracefully manage errors and exceptions.
 
 Key Concepts:
   • try – Write the code you think might cause an error here.
   • catch – If an error happens in the try block, catch it here to prevent the program from crashing.
   • on – Use this to catch a specific type of error (for example, a FormatException) so you can handle that error in a special way.
   • finally – We use the 'finally' clause to guarantee that a block of code always executes, regardless of whether an exception is thrown. The finally block guarantees execution.

Try, on, and catch are used to automatically handle errors when they occur in your code, preventing the program from crashing. 
On the other hand, throw and rethrow are tools you can use to create your own errors or pass an error up the chain. 
In short, try/on/catch help manage errors that happen naturally, while throw/rethrow let you control error handling manually. 
   
   • throw – Use this keyword to intentionally create an error when something unexpected happens in your code, so you can catch and handle it later.
   • rethrow – Use this keyword to pass an error you just caught to a higher-level error handler, allowing another part of your program to deal with it.
 
 This lecture provides examples for:
   1. Handling basic exceptions (division by zero and parsing errors).
   2. Using 'on' to catch specific exceptions.
   3. Throwing and catching custom exceptions.
   4. Using nested try-catch blocks and rethrowing exceptions.
  
Author: Muhammad Azam
===========================================
*/

//////////////////////////////////////////
// Main Function to Execute the Program //
//////////////////////////////////////////
void main() {
  print("Starting error handling demonstration...\n");

// Example 1: Handling a division error.
  divideNumbers(10, 0);
  /*
  Expected Output:
    Attempting to divide 10 by 0...
    Caught an exception: IntegerDivisionByZeroException
    Division operation completed.
  */

// Example 2: Handling a parsing error with specific exception type.
  parseNumber("abc");
  /*
  Expected Output:
    Attempting to parse 'abc' as an integer...
    Caught a FormatException: FormatException: Invalid radix-10 number (at character 1)
    Parsing operation completed.
  */

// Example 3: Throwing and catching a custom exception.
  print("Testing checkNumberLength function:\n");

  // Test case 1: Number with fewer than 3 digits
  try {
    checkNumberLength(42);
  } catch (e) {
    print("Caught an exception: $e");
  }
/*
Output:
    Testing checkNumberLength function:
    Caught an exception: Error: Number 42 is too short. Expected at least 3 digits.
*/

  // Test case 2: Number with 3 or more digits
  try {
    checkNumberLength(1234);
  } catch (e) {
    print("Caught an exception: $e");
  }
// Output: Number 1234 is valid with length 4.

// Example 4: Demonstrating nested try-catch with rethrow.
  try {
    nestedErrorHandling();
  } catch (e) {
    print("Exception rethrown and caught in main: $e");
  }

  print("\nProgram execution completed.");
/*
Output:
Starting nested error handling...
Caught inner exception: IntegerDivisionByZeroException
Caught exception in outer block: IntegerDivisionByZeroException
Nested error handling completed.
Exception rethrown and caught in main: IntegerDivisionByZeroException

Program execution completed.
*/
}

////////////////////////////////////////////////////////////
// 1️⃣ Handling Basic Errors with try, catch, and finally //
///////////////////////////////////////////////////////////
// This function attempts to divide two numbers. A division by zero triggers an exception.
void divideNumbers(int a, int b) {
  print("Attempting to divide $a by $b...");
  try {
    int result = a ~/ b;
    print("Result: $result");
  } catch (e) {
    print("Caught an exception: $e");
  } finally {
    // The finally block always executes, even if an exception occurs.
    print("Division operation completed.");
  }
}

/////////////////////////////////////////////////////////
// 2️⃣ Handling Specific Errors Using "on" and "catch" //
/////////////////////////////////////////////////////////
// This function attempts to parse a string into an integer.
// Using 'on' allows catching a specific exception (FormatException) for more precise error handling.
void parseNumber(String value) {
  print("\nAttempting to parse '$value' as an integer...");
  try {
    int number = int.parse(value);
    print("Parsed number: $number");
  } on FormatException catch (e) {
    print("Caught a FormatException: $e");
  } finally {
    print("Parsing operation completed.");
  }
}

/*
=================================================
 3️⃣ SECTION 3: Custom Error for Number Length Check
=================================================
 This function checks if a number has at least 3 digits.
 If the number has fewer than 3 digits, it throws an error.
*/

void checkNumberLength(int number) {
  String numStr = number.toString();
  if (numStr.length < 3) {
    throw "Error: Number $number is too short. Expected at least 3 digits.";
  } else {
    print("Number $number is valid with length ${numStr.length}.");
  }
}

////////////////////////////////////////////////////
// 4️⃣ Nested Try-Catch and Rethrowing Exceptions //
///////////////////////////////////////////////////
// This function demonstrates a nested try-catch block.
// An exception is caught, logged, and then rethrown to be handled at a higher level.
void nestedErrorHandling() {
  print("\nStarting nested error handling...");
  try {
    // Inner try block that causes an exception.
    try {
      int result = 100 ~/ 0; // Integer division by zero.
      print("Result: $result");
    } catch (e) {
      print("Caught inner exception: $e");
      // Rethrow the exception to let the outer try block handle it.
      rethrow;
    }
  } catch (e) {
    print("Caught exception in outer block: $e");
    // Optionally, further processing can be done here.
    // The exception will be caught in main if not handled completely.
    throw e; // Rethrow again if needed.
  } finally {
    print("Nested error handling completed.");
  }
}
