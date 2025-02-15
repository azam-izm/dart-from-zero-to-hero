/*
===========================================
 Topic: for-in Loop in Dart
===========================================
 The `for-in` loop is a simplified way to iterate over iterable collections 
 such as Lists, Sets, and Maps.

 Syntax:
 for (var element in collection) {
   // Code to execute
 }

 Key Points:
 - Used for iterating through elements of an iterable (List, Set, etc.).
 - Provides a cleaner and more readable syntax than a traditional `for` loop.
 - Cannot be used with non-iterable data types.
===========================================
*/

void main() {
  // Example 1: Iterating over a List
  List<String> colors = ["Red", "Green", "Blue"];

  print("Colors List:");
  for (var color in colors) {
    print(color);
  }

  // Example 2: Iterating over a Set
  Set<int> numbers = {1, 2, 3, 4, 5};

  print("\nNumbers Set:");
  for (var number in numbers) {
    print(number);
  }

  // Example 3: Iterating over a Map (keys and values)
  Map<String, int> ages = {"Azam": 27, "Umar": 28, "Sohail": 26};

  print("\nNames and Ages:");
  for (var name in ages.keys) {
    print("$name is ${ages[name]} years old");
  }

  // Example 4: Iterating over a String (characters)
  String word = "Dart";

  print("\nCharacters in '$word':");
  for (var char in word.runes) {
    print(String.fromCharCode(char));
  }

  // Example 5: Using for-in with a list of objects
  List<Person> people = [
    Person("Azam", 27),
    Person("Umar", 28),
    Person("Sohail", 26)
  ];

  print("\nList of People:");
  for (var person in people) {
    print("${person.name} is ${person.age} years old.");
  }
}

// Class for Example 5
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}
