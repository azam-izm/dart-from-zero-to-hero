/*
===========================================
 Topic: Collection Iterators in Dart
===========================================
 - This program demonstrates different ways to iterate over Dart collections.
 - Collections Covered:
   1. List (Ordered, Duplicates Allowed)
   2. Set (Unordered, Unique Elements)
   3. Map (Key-Value Pairs)
 - Iteration Methods:
   ✅ for-in loop
   ✅ forEach method
   ✅ Using Iterator Object
===========================================
*/

void main() {
  // 1️⃣ Iterating Over a List
  List<String> names = ["Azam", "Umar", "Sohail"];
  print("Iterating over List using for-in loop:");
  for (var name in names) {
    print("Name: $name");
  }
  //Output:
  // Iterating over List using for-in loop:
  // Name: Azam
  // Name: Umar
  // Name: Sohail

  print("\nIterating over List using forEach:");
  names.forEach((name) => print("Name: $name")); // forEach takes a callback function
  //Output:
  // Iterating over List using forEach:
  // Name: Azam
  // Name: Umar
  // Name: Sohail
  
  print("\nIterating over List using Iterator:");
  Iterator<String> listIterator = names.iterator; // Get an iterator for the list
  while (listIterator.moveNext()) { // Move to the next element
    print("Name: ${listIterator.current}"); // Access the current element
  }
  //Output:
  // Iterating over List using Iterator:
  // Name: Azam
  // Name: Umar
  // Name: Sohail

  // 2️⃣ Iterating Over a Set
  Set<int> numbers = {10, 20, 30};
  print("\nIterating over Set using for-in loop:");
  for (var num in numbers) {
    print("Number: $num");
  }
  //Output:
  // Iterating over Set using for-in loop:
  // Number: 10
  // Number: 20
  // Number: 30

  print("\nIterating over Set using forEach:");
  numbers.forEach((num) => print("Number: $num"));
  //Output:
  // Iterating over Set using forEach:
  // Number: 10
  // Number: 20
  // Number: 30

  print("\nIterating over Set using Iterator:");
  Iterator<int> setIterator = numbers.iterator;
  while (setIterator.moveNext()) {
    print("Number: ${setIterator.current}");
  }
  //Output:
  // Iterating over Set using Iterator:
  // Number: 10
  // Number: 20
  // Number: 30

  // 3️⃣ Iterating Over a Map
  Map<String, int> personAges = {"Azam": 27, "Umar": 28, "Sohail": 26};
  
  print("\nIterating over Map (Keys and Values) using forEach:");
  personAges.forEach((key, value) => print("$key is $value years old."));
  //Output:
  // Iterating over Map (Keys and Values) using forEach:
  // Azam is 27 years old.
  // Umar is 28 years old.
  // Sohail is 26 years old.

  print("\nIterating over Map using for-in loop on keys:");
  for (var key in personAges.keys) { // Iterate over keys
    print("$key is ${personAges[key]} years old."); // Access value using key
  }
  //Output:
  // Iterating over Map using for-in loop on keys:
  // Azam is 27 years old.
  // Umar is 28 years old.
  // Sohail is 26 years old.

  print("\nIterating over Map using Iterator:");
  Iterator<MapEntry<String, int>> mapIterator = personAges.entries.iterator;
  while (mapIterator.moveNext()) {
    print("${mapIterator.current.key} is ${mapIterator.current.value} years old.");
  }
  //Output:
  // Iterating over Map using Iterator:
  // Azam is 27 years old.
  // Umar is 28 years old.
  // Sohail is 26 years old.
}

/*
===========================================
Summary:
- Use `for-in` for simple iteration.
- Use `forEach` for concise iteration with a callback.
- Use `Iterator` for more control over iteration.
===========================================
*/