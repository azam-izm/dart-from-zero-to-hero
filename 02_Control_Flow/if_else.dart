/*
  Topic: if_else.dart
  Description: This lesson demonstrates the usage of `if` and `else` statements in Dart. It explains the structure and usage of these conditional statements with examples. It also covers the logical operators (AND, OR) used in conditionals.
*/

void main() {
  // Example 1: Basic if-else statement
  int number = 10;

  // Checking if the number is positive or negative
  if (number > 0) {
    print("The number is positive."); //Output: The number is positive.
  } else {
    print("The number is negative or zero.");
  }

  // Example 2: Using logical operators (OR) with if-else
  int age = 20;
  bool hasParentalConsent = true;

  // Checking if the person is eligible to participate in an event (age >= 18) OR (age < 18 and has parental consent)
  if (age >= 18 || hasParentalConsent) {
    print("Eligible to participate."); //Output: Eligible to participate.
  } else {
    print("Not eligible to participate.");
  }

  // Example 3: Using logical operators (AND) with if-else
  int temperature = 35;
  bool isRaining = false;

  // Checking if the person needs an umbrella (temperature <= 20 AND it is raining)
  if (temperature <= 20 && isRaining) {
    print("It's cold and raining. Take an umbrella!");
  } else {
    print("No umbrella needed."); //Output: No umbrella needed.
  }

  // Example 4: if-else if-else ladder for multiple conditions
  int score = 85;

  // Checking the grade based on the score
  if (score >= 90) {
    print("Grade: A");
  } else if (score >= 80) {
    print("Grade: B"); //Output: Grade: B
  } else if (score >= 70) {
    print("Grade: C");
  } else if (score >= 60) {
    print("Grade: D");
  } else {
    print("Grade: F");
  }

  // Example 5: Nested if-else with multiple conditions and deeper nesting
  bool isWeekend = false; // It's not the weekend
  bool isHoliday = false; // It's not a holiday
  bool isSunny = false; // The weather doesn't matter for this condition
  bool isTired = true; // The person is tired

  // Checking if the person has free time and mood on a weekend
  if (isWeekend) {
    if (isSunny) {
      print(
          "It's the weekend, and it's sunny! Perfect day for outdoor activities.");
    } else {
      print(
          "It's the weekend, but it's not sunny. A relaxing indoor day is best.");
    }
  } else {
    // If it's not the weekend, check if it's a holiday
    if (isHoliday) {
      if (isTired) {
        // If it's a holiday but the person is tired, take a rest
        print("It's a holiday, but you're tired. It's a good time to rest.");
      } else {
        // If it's a holiday and the person is not tired, enjoy some free time
        print("It's a holiday! Enjoy your free time while you're energized.");
      }
    } else {
      // If it's not the weekend or holiday, it's a regular day
      if (isTired) {
        // If the person is tired, suggest taking it easy
        print("It's a regular workday, but you're tired. Take it easy today."); //Output: It's a regular workday, but you're tired. Take it easy today.
      } else {
        print("It's a regular day. Time to work hard!");
      }
    }
  }
}
