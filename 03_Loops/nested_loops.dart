/*
===========================================
 Topic: Nested Loops in Dart
===========================================
 Nested loops are loops inside another loop. The inner loop runs completely 
 for each iteration of the outer loop.

 Syntax:
 for (outer loop condition) {
   for (inner loop condition) {
     // Code to execute
   }
 }

 Key Points:
 - Used when working with multi-dimensional structures (e.g., tables, grids).
 - The inner loop runs fully for each iteration of the outer loop.
 - Can be used with `for`, `while`, and `do-while` loops.
===========================================
*/

void main() {
  print("Multiplication Table (1 to 3):"); //Output: Multiplication Table (1 to 3):
  
  // Example 1: Multiplication Table using Nested for Loop
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print("$i x $j = ${i * j}"); 
      //Output: 1 x 1 = 1, 1 x 2 = 2, 1 x 3 = 3, 2 x 1 = 2, 2 x 2 = 4, 2 x 3 = 6, 3 x 1 = 3, 3 x 2 = 6, 3 x 3 = 9
    }
    print(""); // Newline for readability
  }

  print("Printing a Pattern:"); //Output: Printing a Pattern:
  // Example 2: Printing a Right-Angled Triangle Pattern
  int rows = 4;
  for (int i = 1; i <= rows; i++) {
    String line = "";
    for (int j = 1; j <= i; j++) {
      line += "* ";
    }
    print(line); 
    //Output: 
    //* 
    //* * 
    //* * * 
    //* * * * 
  }

  print("\nIterating a List of Lists:"); //Output: Iterating a List of Lists:
  // Example 3: Using Nested Loops to Iterate Over a List of Lists
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  for (var row in matrix) {
    for (var value in row) {
      print(value); 
      //Output: 1, 2, 3, 4, 5, 6, 7, 8, 9
    }
  }
}
