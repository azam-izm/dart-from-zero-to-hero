/*
===========================================
 Topic: Switch Case in Dart
===========================================
 This program demonstrates the use of the switch-case statement in Dart. 
 The switch statement is an alternative to using multiple if-else conditions 
 when comparing a single variable against multiple possible values.

 Key Points:
 - The `switch` statement evaluates an expression.
 - Each `case` represents a possible value.
 - The `break` statement stops further execution inside the switch block.
 - The `default` case executes when no other case matches.
 - Dart supports `switch` with strings, integers, enums, and more.
===========================================
*/

void main() {
  // Example 1: Switch-case with integers (days of the week)
  int dayNumber = 3;
  print("Example 1: Days of the Week"); //Output: Example 1: Days of the Week

  switch (dayNumber) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday"); //Output: Wednesday
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day number! Please use a number between 1 and 7.");
  }

  // Example 2: Switch-case with strings (traffic light colors)
  String trafficLightColor = "YELLOW";
  print("\nExample 2: Traffic Light Colors"); //Output: Example 2: Traffic Light Colors

  switch (trafficLightColor.toLowerCase()) {
    case 'red':
      print("Stop!");
      break;
    case 'yellow':
      print("Get Ready!"); //Output: Get Ready!
      break;
    case 'green':
      print("Go!");
      break;
    default:
      print("Invalid color! Please enter red, yellow, or green.");
  }
}
