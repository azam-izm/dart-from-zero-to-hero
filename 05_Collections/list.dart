/*
===========================================
 Topic: List
===========================================
 - A list in Dart is an ordered collection of elements, similar to arrays in other languages.
 - Lists in Dart are zero-based indexed, meaning the first element has index 0.
 - Lists allow duplicate values.

 - Dart provides two types of lists:
   1. Fixed-length list (Immutable size)
   2. Growable list (Default, dynamic size)

 - List is a predefined class in Dart and implements the Iterable interface.
 - Lists support various operations like adding, removing, updating, searching, filtering, sorting, and 
   iterating over elements.

 - Dart provides multiple constructors to create lists:
   1. List.filled(length, value) - Creates a fixed-length list with default values
   2. List.generate(length, (index) => expression) - Generates list elements dynamically
   3. List.of(iterable) - Creates a list from another iterable and checks the types at compile time.
   4. List.from(iterable) - Creates a new list with elements from another iterable and checks the types 
   at runtime.

 - Additionally, this lecture demonstrates iterating over lists (using for, for-in, forEach), copying lists 
   (using List.of vs. List.from), and advanced operations like expanding nested lists and converting lists to sets.

 - This lecture covers all possible list operations in Dart with detailed examples.

Author: Muhammad Azam
===========================================
*/

void main() {
// ====================================================
// Section 1: Creating Lists
// ====================================================
  print('Section 1: Creating Lists');
// 1.1 Creating a list using a literal:
  List<String> names = ["Azam", "Umar", "Sohail"];
  print("\n1.1 Names list: $names"); // Output: [Azam, Umar, Sohail]

// 1.2 Creating an empty growable list using a literal:
  List<int> emptyGrowable = [];
  print("1.2 Empty growable list: $emptyGrowable"); // Output: []
  emptyGrowable.add(7);
  print("1.2 Empty growable list: $emptyGrowable"); // Output: [7]

// 1.3 Creating an empty fixed-length list using List.empty():
//    List.empty() creates a fixed-length list (growable: false) by default, 
//    Fixed-length lists cannot have elements added or removed after creation.
  List<int> emptyFixed = List.empty(); // Fixed-length empty list
  print("1.3 Empty fixed-length list (List.empty with default): $emptyFixed"); // Output: []
  //   emptyFixed.add(5); //Uncommenting this line will cause a runtime error.

// 1.4 Creating an empty growable list using List.empty():
//    Here we explicitly set growable: true, so the list can be modified.
  List<String> emptyGrowable2 = List.empty(growable: true);
  print("1.4 Empty growable list (List.empty with growable:true): $emptyGrowable2"); // Output: []

/* 
1.5 Fixed-Length List (growable: false)
------------------------------------
 - List.filled(3, "") creates a list of 3 elements, each initialized to the empty string.
 - By default, List.filled creates a fixed-length list (growable is false).
 - In a fixed-length list, you can modify the elements at existing indices (0, 1, and 2),
 - but you cannot add or remove elements.
 - Attempting to call methods like add() will result in a runtime error.
*/

// Creating a fixed-length list of 3 strings.
  List<String> fixedList = List.filled(3, "");
  fixedList[0] = "Ali";
  fixedList[1] = "Awais";
  fixedList[2] = "Asad";

  print("1.5 Fixed-length list (growable: false): $fixedList"); // Output: [Ali, Awais, Asad]

  // Uncommenting the following line will cause a runtime error because the list is fixed-length.
  // fixedList.add("Ali"); // ERROR: Cannot add element to a fixed-length list

/*
1.6 Growable List (growable: true)
-------------------------------
- By setting the parameter growable: true in List.filled, the list becomes dynamic.
- The list still starts with 3 elements (all initialized to ""), but you can add new elements later.
- This allows you to extend the list beyond its initial length.
*/

// Creating a growable list with the same initial configuration.
  List<String> growableList = List.filled(3, "", growable: true);
  growableList[0] = "Babar";
  growableList[1] = "Bashir";
  growableList[2] = "Bilal";

  // Since the list is growable, you can add new elements.
  growableList.add("Bilqis");
  print("1.6 Growable list (growable: true): $growableList"); // Output: [Babar, Bashir, Bilal, Bilqis]

// ====================================================
// Section 2: Declaring Lists with Type Annotations
// ====================================================
  print('\nSection 2: Declaring Lists with Type Annotations');
  // There are several ways to declare a list.

// 2.1 Declaration with explicit generic type on the variable:
  //    This means the variable is fixed as a List of String.
  List<String> listA = ['User 1', 'User 2'];
  listA.add("User 3");
//   listA.add(123); // ERROR: The argument type 'int' can't be assigned to the parameter type 'String'.
  print("\n2.1 listA: $listA"); //Output: [User 1, User 2, User 3]

// 2.2 Declaration with a raw list type on the variable:
  //    In this case, the variable 'listB' is dynamic (List<dynamic>), meaning you can later override
  //    the entire variable listB with a list of any type. However, the list literal is explicitly typed
  //    as <String>[]; so its elements must be Strings. Since the variable listB itself is dynamic,
  //    you can completely override it with another type later if needed, but you cannot add elements
  //    of another data type except String.
  List listB = <String>['Only String values allowed here!'];
  listB.add("World");
  //listB.add(123);  // Uncommenting this will cause a type error because the literal is of type <String>.
  print("2.2 listB: $listB"); //Output: [Only String values allowed here!, World]
  listB = [1, 2, 3, 4, 5]; //Allowed because listB itself is dynamic.
  print("2.2 listB: $listB"); //Output: [1, 2, 3, 4, 5]

// 2.3 Declaration with explicit generic type on both the variable and the literal.
  //    This is the most type-safe approach.
  List<String> listC = <String>[];
  listC.add("Dart");
  // listC.add(456); // ERROR: 456 is not a String.
  //listC = [1,2,3,4,5]; //ERROR: new list is not a String.
  print("2.3 listC: $listC"); //Output: [Dart]

// 2.4 Using 'const' to create an immutable (constant) list.
  //    The list and its elements cannot be changed.
  const List<String> constListA = <String>["Immutable", "List"];
  // constListA.add("Test"); // ERROR: Can't add to a const list.
  //constListA = ['Not possible']; //ERROR: Constant variables can't be assigned a value.
  print("2.4 constListA: $constListA"); //Output: [Immutable, List]

// 2.5 Here, list is not const, but its initial values are const.
  List<String> listFromConst = const ["Fixed", "Data"];
  // listFromConst[0] = "Change"; // ERROR: Cannot modify a const list.
  print("2.5 listFromConst: $listFromConst"); //Output: [Fixed, Data]
  // Even though the initial literal is const, the variable listFromConst is mutable and can be reassigned entirely.
  listFromConst = ['Mutable', 'List'];
  print("2.5 listFromConst: $listFromConst"); //Output: [Mutable, List]

// ====================================================
// Section 3: Accessing List Elements
// ====================================================
  print('\nSection 3: Accessing List Elements');
//Access elements using the index operator.
  print("\n3.1 First element: ${names[0]}"); // Output: Azam
  print("3.2 Second element: ${names[1]}"); // Output: Umar
  print("3.3 Last element Index Number: ${[names.length - 1]}"); // Output: [2]

// Accessing elements using a for loop with index.
  print("\n3.4 Accessing elements using a for loop:");
  for (int i = 0; i < names.length; i++) {
    print("3.5 Element at index $i: ${names[i]}"); // Output: Azam, Umar, Sohail
  }

// Accessing elements using a for-in loop.
  print("\n3.6 Accessing elements using a for-in loop:");
  for (var name in names) {
    print(name); // Output: Azam, Umar, Sohail
  }

  // Accessing elements using forEach.
  print("\n3.7 Accessing elements using forEach:");
  names.forEach((name) => print(name)); // Output: Azam, Umar, Sohail

// ====================================================
// Section 4: List Constructors and Copying Lists
// ====================================================
  print('\nSection 4: List Constructors and Copying Lists');
  // Fixed-length list using List.filled.
  List<int> fixedNumList = List.filled(5, 0);
  print("\n4.1 List.filled: $fixedNumList"); //Output: [0, 0, 0, 0, 0]

  // Generated list using List.generate.
  List<int> generatedList = List.generate(5, (index) => index * 2);
  print("4.2 List.generate: $generatedList"); //Output: [0, 2, 4, 6, 8]

  // Copying a list using List.of (enforces type checking at compile time).
  List<int> copiedList = List.of(generatedList);
  print("4.3 List.of: $copiedList"); //Output: [0, 2, 4, 6, 8]

  // Copying a list using List.from: type checking at runtime.
  List<int> copiedList2 = List.from(generatedList);
  print("4.4 List.from: $copiedList2"); //Output: [0, 2, 4, 6, 8]

// ====================================================
// Section 5: Modifying a List
// ====================================================
  print('\nSection 5: Modifying a List');
  // Adding an element.
  names.add("Ali");
  print("\n5.1 Adding 'Ali': $names"); //Output: [Azam, Umar, Sohail, Ali]

  // Removing an element by value.
  names.remove("Umar");
  print("5.2 Removing 'Umar': $names"); //Output: [Azam, Sohail, Ali]

  // Updating an element at a specific index.
  names[1] = "Hassan";
  print("5.3 Updating second element to 'Hassan': $names"); //Output: [Azam, Hassan, Ali]

  // 5.4 Clearing the list
  print("\n5.4 Clearing elements:");
  List<int> clearDemo = [1, 2, 3];
  print("Before clear: $clearDemo"); // [1, 2, 3]
  clearDemo.clear();
  print("After clear: $clearDemo"); // []

  // 5.5 Modifying ranges with setRange
  List<int> rangeList = [1, 2, 3, 4, 5];
  // Replaces elements from index 1 (inclusive) to 4 (exclusive).
  rangeList.setRange(1, 4, [10, 20, 30]);
  print("\n5.5 After setRange: $rangeList"); // [1, 10, 20, 30, 5]

// ====================================================
// Section 6: Working with List Properties and Operations
// ====================================================
  print('\nSection 6: Working with List Properties and Operations');

  // -- List Properties --
  print("\n6.1 Properties:");
  print("6.2 Total elements in names: ${names.length}"); // Output: 3
  print("6.3 Is the names list empty? ${names.isEmpty}"); // Output: false
  print("6.4 Is the names list not empty? ${names.isNotEmpty}"); // Output: true

  // -- Creating a Numbers List for Demonstration --
  List<int> numbers = [100, 20, 350, 40, 50];

  // Note: All modifications on the 'numbers' list below are applied sequentially. 
  // Each change affects the list for the next operation.

  // -- Adding Elements --
  // Add a single element, multiple elements, and insert at specific indices.
  numbers.add(60); // Adds 60 at the end.
  numbers.addAll([70, 80]); // Adds 70 and 80 at the end.
  numbers.insert(2, 30); // Inserts 30 at index 2.
  numbers.insertAll(4, [35, 75, 75]); // Inserts 35, 75 and 75 starting at index 4.
  print("\n6.5 Numbers list after adding elements: $numbers"); // Output: [100, 20, 30, 350, 35, 75, 75, 40, 50, 60, 70, 80]

  // -- Removing Elements --
  // Remove by value, by index, remove last, and remove elements conditionally.
  numbers.remove(75); // Removes the first occurrence of 75.
  numbers.removeAt(1); // Removes element at index 1.
  numbers.removeLast(); // Removes the last element.
  numbers.removeWhere((num) => num < 70); // Removes all elements less than 70.
  print("\n6.6 Numbers list after removing elements: $numbers"); // Output: [100, 350, 75, 70]

  // -- Searching & Checking --
  print("\n6.7 Searching & Checking:");
  print("6.8 Does numbers list contain 350? ${numbers.contains(350)}"); // Output: true
  print("6.9 Index of 75 in numbers: ${numbers.indexOf(75)}"); // Output: 2
  print("6.10 Last index of 75 in numbers: ${numbers.lastIndexOf(75)}"); // Output: 2

  // -- Modifying List Elements Using Range Methods --
  // Replace a range of elements and fill a range with a specific value.
  numbers.replaceRange(2, 4, [99, 100]); // Replaces elements at indices 2 and 3.
  numbers.fillRange(0, 2, 5); // Fills indices 0 and 1 with 5.
  print("\n6.11 Numbers list after range modifications: $numbers"); // Output: [5, 5, 99, 100]

  // -- Sorting and Filtering --
  numbers.sort(); // Sorts the list.
  print("\n6.12 Sorted numbers list: $numbers"); // Output: [5, 5, 99, 100]
 // where method is used to filter the elements of the list
  List<int> evenNumbers = numbers.where((num) => num % 2 == 0).toList(); // Filters even numbers.
  print("6.13 Filtered even numbers: $evenNumbers"); // Output: [100]

  // -- Mapping List Elements --
  // Creates a new list where each element is squared. .map is used to transform each element of the list.
  List<int> squaredNumbers = numbers.map((num) => num * num).toList();
  print("\n6.14 Squared numbers: $squaredNumbers"); // Output: [25, 25, 9801, 10000]

  // Index search with conditions
  print("\n6.15 Index search:");
  List<int> ages = [18, 24, 17, 32, 15];
  int firstAdult = ages.indexWhere((age) => age >= 18);
  print("6.16 First adult index: $firstAdult"); // 0
  int lastTeen = ages.lastIndexWhere((age) => age < 18);
  print("6.17 Last teen index: $lastTeen"); // 4
  print("\n6.18 Element search:");

// Note: Using the orElse parameter is important to prevent runtime errors 
// if no matching element is found. Without it, firstWhere or lastWhere would throw a StateError.
  int firstEven = numbers.firstWhere((n) => n % 2 == 0, orElse: () => -1);
  print("6.19 First even: $firstEven"); // 100
  int lastOdd = numbers.lastWhere((n) => n % 2 != 0, orElse: () => -1);
  print("6.20 Last odd: $lastOdd"); // 99

  // Condition checks
  print("\n6.21 Condition checks:");
  print("6.22 Any negative? ${numbers.any((n) => n < 0)}"); // false
  print("6.23 All positive? ${numbers.every((n) => n > 0)}"); // true

  // Aggregation operations
  print("\n6.24 Aggregation:");
  // Note: reduce throws an error if the list is empty. Use fold for safety.
  int sum = numbers.reduce((a, b) => a + b); 
  print("6.25 Sum with reduce: $sum"); // 209

  //.fold take initialValue and can be used with empty list, while .reduce doesn't, this is the difference between them.
  // Using 0.0 ensures the sum is a double for precise division.
  double average = numbers.fold(0.0, (a, b) => a + b) / numbers.length;
  print("6.26 Average with fold: $average"); // 52.25

  // Sub-iterables
  print("\n6.27 Sub-iterables:");
  List<int> skipped = numbers.skip(2).toList();
  print("6.28 Skip first 2: $skipped"); // [99, 100]
  List<int> taken = numbers.take(3).toList();
  print("6.29 Take first 3: $taken"); // [5, 5, 99]

  // -- Reversing a List --
  List<int> reversedNumbers = numbers.reversed.toList();
  print("\n6.30  Reversed numbers list: $reversedNumbers"); // Output: [100, 99, 5, 5]

  // -- Shuffling a List --
  List<int> numbersDemo = [10, 20, 30, 40, 50];
  numbersDemo.shuffle();
  print("6.31 Shuffled numbers list: $numbersDemo");
  // Output: Expected output: Order may vary [40, 10, 20, 50, 30]

// ====================================================
// Section 7: Expanding Nested Lists
// ====================================================

  List<List<int>> nestedList = [[1, 2], [3, 4], [5, 6] ];
  List<int> expandedList = nestedList.expand((list) => list).toList();
  print("\n7.1 Expanded list from nestedList: $expandedList"); //Output: [1, 2, 3, 4, 5, 6]

  // 7.2 Type casting 
  List<num> mixedNumbers = [1, 2.5, 3];
  // The cast fails here at runtime due to double values.
  List<int> intList = mixedNumbers.cast<int>(); 
  // Uncommenting this will throw error at runtime, type 'double' is not a subtype of type 'int' in type cast
  // print("\n7.2 Casted list: $intList");

  // 7.3 List to Map conversion
  List<String> fruits = ['apple', 'banana', 'orange'];
  Map<int, String> fruitMap = fruits.asMap();
  print("\n7.3 List as map: $fruitMap"); // {0: apple, 1: banana, 2: orange}

// ====================================================
// Section 8: Converting a List to a Set
// ====================================================
  print('\nSection 8: Converting a List to a Set');

  List<int> duplicateNumbers = [10, 20, 30, 30, 40, 50, 50];
  Set<int> uniqueNumbers = duplicateNumbers.toSet();
  print("\n8.1 Converted set from numbers list: $uniqueNumbers"); //Output: {10, 20, 30, 40, 50}

// ====================================================
// Section 9: Direct Element Access
// ====================================================
  print('\nSection 9: Direct Element Access');

//First/last element access
  print("\n9.1 Element access:");
  print("9.2 First element: ${numbers.first}"); // 5
  print("9.3 Last element: ${numbers.last}"); // 100
  print("9.4 Element at index 3: ${numbers.elementAt(3)}"); // 100 


//Single element check
  List<int> singleList = [42];
  print("\n9.5 Single element:");
  print("9.6 Single element: ${singleList.single}"); // 42
// [1,2].single; // Throws StateError
}
