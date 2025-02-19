/*
===========================================
 Topic: Set
===========================================
 - A Set in Dart is an unordered collection of unique elements.
 - Sets do not allow duplicate values, making them ideal for membership testing.
 - Elements in a Set are not indexed by position (no index-based access).

 - Dart provides two main Set implementations:
   1. HashSet: Unordered collection with fast operations (O(1) average complexity)
   2. LinkedHashSet: Maintains insertion order (default Set implementation)

 - Set is a predefined class in Dart and implements the Iterable interface.
 - Sets support operations like union, intersection, difference, and subset checks.

 - Key Set characteristics:
   - Automatic duplicate elimination
   - Faster element lookup than Lists (contains() is O(1) vs O(n) for Lists)
   - No positional access (elements can't be accessed via [index])

 - Common Set operations include adding/removing elements, checking membership,
   and performing mathematical set operations.

 - This lecture covers Set creation methods, type annotations, operations,
   conversions to/from Lists, and working with custom objects in Sets.

Author: Muhammad Azam
===========================================
*/
import 'dart:collection'; // This import is necessary to use advanced collection classes like HashSet 
// and LinkedHashSet.For example, HashSet is used in Section 1.6 and LinkedHashSet in Section 4.3.


void main() {
// ====================================================
// Section 1: Creating Sets
// ====================================================
  print('Section 1: Creating Sets');

// 1.1 Creating a Set using literal syntax
  Set<String> colors = {'red', 'green', 'blue'};
  print("\n1.1 Colors Set: $colors"); // Output: {red, green, blue}

// 1.2 Creating an empty growable Set
  Set<int> emptySet = <int>{};
  print("1.2 Empty Set: $emptySet"); // Output: {}
  emptySet.add(42);
  emptySet.add(42); // Duplicate ignored
  print("1.2 After adding elements: $emptySet"); // Output: {42}

// 1.3 Creating a Set with duplicate elements (auto-deduplicated)
  Set<int> numbers = {1, 2, 3, 2, 1};
  print("1.3 Deduplicated numbers: $numbers"); // Output: {1, 2, 3}

// 1.4 Creating an unmodifiable Set
  final Set<String> fixedSet = Set.unmodifiable(colors);
  print("1.4 Unmodifiable Set: $fixedSet"); // Output: {red, green, blue}
  // fixedSet.add('yellow'); // Runtime error: Cannot add to unmodifiable set

// 1.5 Creating a Set using the default constructor (LinkedHashSet)
  Set<String> cities = Set();
  cities.add('London');
  print("\n1.5 Default constructor: $cities"); // Output: {London}

/* 1.6 Creating a HashSet (unordered)
  Note: Although the HashSet might display elements in an ordered manner (e.g., {1, 2, 3})
  when printed, this order is not guaranteed because HashSet is optimized for fast lookup
  and does not preserve insertion order. If maintaining the order is important, consider using
  a LinkedHashSet instead. */
  Set<int> hashSet = HashSet();
  hashSet.addAll([3, 1, 2]);
  print("1.6 HashSet (unordered): $hashSet"); // Possible output: {1, 2, 3}

// 1.7 Using Set.from() to create from any iterable
  Set<int> fromList = Set.from([1, 2, 2, 3]);
  print("1.7 Set.from(): $fromList"); // Output: {1, 2, 3}

// 1.8 Using Set.of() for type-safe creation
  Set<int> ofSet = Set.of({10, 20, 30});
  print("1.8 Set.of(): $ofSet"); // Output: {10, 20, 30}

// ====================================================
// Section 2: Declaring Sets with Type Annotations
// ====================================================
  print('\nSection 2: Declaring Sets with Type Annotations');

// There are several ways to declare a Set in Dart, each with its own type safety and flexibility.

// 2.1 Declaration with explicit generic type on the variable, this means the variable is fixed as a Set
//of double. The Set can only contain elements of type double.
  Set<double> temperatures = {36.5, 37.2, 38.1};
  temperatures.add(37.8); // Adding a valid double value
// temperatures.add('hot'); // ERROR: The argument type 'String' can't be assigned to the parameter type 'double'.
  print("\n2.1 Temperatures: $temperatures"); // Output: {36.5, 37.2, 38.1, 37.8}

/*  2.2 Declaration with a raw Set type on the variable:
    In this case, the variable 'dynamicSet' is dynamic (Set<dynamic>), meaning you can later override
    the entire variable dynamicSet with a Set of any type. However, the Set literal is explicitly typed
    as <num>{}; so its elements must be numbers (int or double). Since the variable dynamicSet itself is 
    dynamic, you can completely override it with another type later if needed, but you cannot add elements
    of another data type except num.  */
  Set dynamicSet = <num>{1, 2.5, 3}; // Enforces num type elements at runtime
  dynamicSet.add(4.7); // Adding a valid num value
// dynamicSet.add('text'); // ERROR: Runtime type check error, 'String' is not a 'num'.
  print("2.2 Dynamic Set: $dynamicSet"); // Output: {1, 2.5, 3, 4.7}
  dynamicSet = {'A', 'B', 'C'}; // Allowed because dynamicSet itself is dynamic.
  print("2.2 Dynamic Set after reassignment: $dynamicSet"); // Output: {A, B, C}

/* 2.3 Declaration with explicit generic type on both the variable and the literal:
    This is the most type-safe approach. The variable is explicitly typed as Set<String>,
    and the literal is also explicitly typed as <String>{}. This ensures that only
    String values can be added to the Set.  */
  Set<String> fruitsSet = <String>{'apple', 'banana', 'orange'};
  fruitsSet.add('mango'); // Adding a valid String value
// fruits.add(123); // ERROR: The argument type 'int' can't be assigned to the parameter type 'String'.
  print("2.3 Fruits Set: $fruitsSet"); // Output: {apple, banana, orange, mango}

// 2.4 Using 'const' to create an immutable (constant) Set:
//    The Set and its elements cannot be changed. Any attempt to modify the Set
//    will result in a runtime error.
  const Set<String> constSet = const {'apple', 'banana', 'orange'};
// constSet.add('grape'); // ERROR: Cannot add to an unmodifiable Set.
// constSet = {'new', 'set'}; // ERROR: Constant variables can't be assigned a value.
  print("2.4 Constant Set: $constSet"); // Output: {apple, banana, orange}

/* 2.5 Here, the Set is not const, but its initial values are const:
    The variable 'setFromConst' is not const, so it can be reassigned later.
    However, the initial Set is immutable, so modifications to the initial Set
    are not allowed. */
  Set<String> setFromConst = const {'Fixed', 'Data'};
// setFromConst.add('Change'); // ERROR: Cannot modify an unmodifiable Set.
  print("2.5 Set from const: $setFromConst"); // Output: {Fixed, Data}
  setFromConst = {'Mutable', 'Set'}; // Allowed because setFromConst is not const.
  print("2.5 Set from const after reassignment: $setFromConst"); // Output: {Mutable, Set}

// ====================================================
// Section 3: Basic Set Operations
// ====================================================
  print('\nSection 3: Basic Set Operations');

  Set<String> fruits = {'apple', 'banana', 'orange'};

  // 3.1 Adding elements
  fruits.add('mango');
  fruits.addAll({'grape', 'kiwi'});
  print("\n3.1 After adding: $fruits"); // Output: {apple, banana, orange, mango, grape, kiwi}

  // 3.2 Removing elements
  fruits.remove('banana');
  fruits.removeWhere((fruit) => fruit.startsWith('k'));
  print("3.2 After removal: $fruits"); // Output: {apple, orange, mango, grape}

  // 3.3 Membership check
  print("3.3 Contains 'apple'? ${fruits.contains('apple')}"); // true
  print("3.3 Contains 'pear'? ${fruits.contains('pear')}"); // false

  // 3.4 Set properties
  print("3.4 Number of fruits: ${fruits.length}"); // 4
  print("3.4 Is empty? ${fruits.isEmpty}"); // false

  // 3.5 Iterating through elements
  print("\n3.5 Iterating with for-in:");
  for (String fruit in fruits) {
    print(fruit); // apple, orange, mango, grape (order may vary)
  }

// 3.6 Accessing Elements
//first/last: Work with insertion order in LinkedHashSet (default)
//elementAt: Available but not recommended (O(n) time complexity)

  print("3.6 First element: ${fruits.first}"); // apple
  print("3.6 Last element: ${fruits.last}"); // grape
  print("3.6 Element at index 1: ${fruits.elementAt(1)}"); // orange

// 3.7 Clearing a Set
  //clear(): Demonstrates complete removal of all elements
  Set<String> userNames = {'Username1', 'Username2', 'Username3'};
  userNames.clear();
  print('3.7 Clear $userNames'); //{}

// ====================================================
// Section 4: Set Constructors and Copying
// ====================================================
  print('\nSection 4: Set Constructors and Copying');

  // 4.1 Creates a Set from any iterable, and strict type checking at COMPILE TIME
  Set<int> numberSet = Set.of([1, 2, 2, 3, 3]);
  print("\n4.1 From List: $numberSet"); // {1, 2, 3}

  // 4.2 Creating a Set from another Set (type checked at runtime)
  Set<num> mixedNumbers = Set.from(numberSet);
  mixedNumbers.add(4.5);
  print("4.2 Mixed numbers: $mixedNumbers"); // {1, 2, 3, 4.5}

  // 4.3 Creating a LinkedHashSet (maintains insertion order)
  final orderedSet = LinkedHashSet.from(['first', 'second', 'third']);
  print("4.3 Ordered Set: $orderedSet"); // {first, second, third}

/* 4.4 Creating Unordered Set (HashSet)
 Note: The HashSet is optimized for fast lookup, so it doesn't preserve the insertion order.
 Even if the elements are added in a specific order, the printed order may vary.
 For example, the output might not match the insertion order. If maintaining order is required,
 consider using a LinkedHashSet instead. */
  final unorderedSet = HashSet.from([3, 1, 2]);
  print("4.4 HashSet (order not guaranteed): $unorderedSet"); // Output may vary, e.g., {2, 1, 3}

// ====================================================
// Section 5: Set-Specific Operations
// ====================================================
  print('\nSection 5: Set-Specific Operations');

  Set<int> setA = {1, 2, 3, 4};
  Set<int> setB = {3, 4, 5, 6};

  // 5.1 Union
  print("\n5.1 Union: ${setA.union(setB)}"); // {1, 2, 3, 4, 5, 6}

  // 5.2 Intersection
  print("5.2 Intersection: ${setA.intersection(setB)}"); // {3, 4}

  // 5.3 Difference (setA - setB = contains elements that setB doesn't have)
  print("5.3 Difference (A-B): ${setA.difference(setB)}"); // {1, 2}
  print("5.3 Difference (B-A): ${setB.difference(setA)}"); // {5, 6}

  // 5.4 Subset checks
  print("5.4 setA contain both elements 3 and 4? ${setA.containsAll([3,4])}"); // true
  print("5.4 A is superset of {2,3}? ${setA.containsAll([2, 3])}"); // true

// ====================================================
// Section 6: Converting to Lists and Other Structures
// ====================================================
  print('\nSection 6: Conversions');

  // 6.1 Set to List
  List<String> fruitList = fruits.toList();
  print("\n6.1 Converted List: $fruitList"); // [apple, orange, mango, grape]

  // 6.2 List to Set (deduplicate)
  Set<int> uniqueNumbers = [1, 2, 2, 3].toSet();
  print("6.2 Deduplicated Set: $uniqueNumbers"); // {1, 2, 3}

  // 6.3 Set to Map
  Map<String, int> fruitLengths = Map.fromIterable(
    fruits,
    key: (fruit) => fruit, // Key remains the same
    value: (fruit) =>
        (fruit as String).length, // Value is the length of the string
  );
  print("6.3 Fruit length map: $fruitLengths"); // {apple: 5, orange: 6, mango: 5, grape: 5}

// ====================================================
// Section 7: Advanced Set Operations
// ====================================================
  print('\nSection 7: Advanced Operations');

// 7.1 Retain elements matching condition
  Set<int> primes = {2, 3, 4, 5, 6};
  //If n is 2, 3, or 5, the function returns true. Otherwise, it returns false.
  primes.retainWhere((n) => [2, 3, 5].contains(n));
  print("\n7.1 Primes: $primes"); // {2, 3, 5}

// 7.2 Remove all elements from another set
  primes.removeAll({3, 5});
  print("7.2 After removal: $primes"); // {2}

// 7.3 Check any/every element
  print("7.3 Any even? ${primes.any((n) => n % 2 == 0)}"); // true
  print("7.3 All even? ${primes.every((n) => n % 2 == 0)}"); // true

// 7.4 Filtering with where
  Set<int> filtered = primes.where((n) => n > 5).toSet();
  print("7.4 Filtered set: $filtered"); // {}

// 7.5 Expanding Nested Sets
// - expand() is used to flatten nested Sets into a single Set
// - Works similarly to List expansion but maintains uniqueness
  Set<Set<int>> nestedSet = {{1, 2}, {3, 4}, {5, 6}};

// Flatten the nested Set into a single Set
  Set<int> flattened = nestedSet.expand((s) => s).toSet();
  print("\n7.5 Nested Set: $nestedSet"); // {{1, 2}, {3, 4}, {5, 6}}
  print("7.5 Flattened Set: $flattened"); // {1, 2, 3, 4, 5, 6}

// ====================================================
// Section 8: Working with Custom Objects
// ====================================================
  print('\nSection 8: Custom Objects in Sets');

  print("\n8.1 People Set (deduplicated): $people"); // Output: {Azam (27), Umar (28)}
}

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() => '$name ($age)';
}

// 8.1 Set with custom objects
Set<Person> people = {
  Person('Azam', 27),
  Person('Umar', 28),
  Person('Azam', 27) // Duplicate
};
