/*
  Topic: ternary_operator.dart
  Description: This lesson explains the usage of the ternary operator in Dart. It demonstrates how to use this concise conditional expression to perform conditional checks in a single line.
*/

void main() {
  // Using the ternary operator to check if a number is even or odd.
  int number = 5;

  // The ternary operator: condition ? value_if_true : value_if_false
  String result = (number % 2 == 0) ? "Even" : "Odd";
  print("The number $number is: $result"); //Output: The number 5 is: Odd

  // Example with a simple ternary operator for age verification
  int age = 18;
  String status = (age >= 18) ? "Adult" : "Minor";
  print("You are an $status."); //Output: You are an Adult.

  // Example with a ternary operator for a simple eligibility check
  bool isEligibleForVote = true;
  String voteEligibility = (isEligibleForVote) ? "Eligible to vote" : "Not eligible to vote";
  print(voteEligibility); //Output: Eligible to vote

  // Nested ternary operator (not recommended for readability, but works for quick checks)
  int marks = 85;
  String grade = (marks >= 90) ? "A+" : (marks >= 75) ? "A" : (marks >= 50) ? "B" : "C";
  print("Your grade is: $grade"); //Output: Your grade is: A

  // Ternary operator used inside a function for decision-making
  String checkStatus(int score) {
    return (score >= 50) ? "Passed" : "Failed";
  }

  int score = 55;
  print("The student has ${checkStatus(score)} the exam."); //Output: The student has Passed the exam.
}
