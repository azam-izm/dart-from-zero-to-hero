/*
===========================================
 Topic: Map
===========================================
 - A Map in Dart is an unordered collection of key-value pairs.
 - Keys are unique and used to retrieve corresponding values.
 - Values can be duplicated but keys cannot.
 - Maps are ideal for data association and lookup operations.

 - Dart provides several Map implementations:
   1. HashMap: Unordered collection with fast operations (O(1) average complexity)
   2. LinkedHashMap: Maintains insertion order (default Map implementation)
   3. SplayTreeMap: Maintains elements in sorted order

 - Key Map characteristics:
   - Dynamic size by default (growable)
   - Keys must implement proper hashCode and == operator
   - Values can be of any type, including null
   - Faster key-based lookup than Lists

 - Common Map operations include:
   - Add/update entries
   - Check key existence
   - Iterate through entries
   - Merge maps
   - Transform keys/values

 - This lecture covers Map creation methods, type annotations, operations,
   conversions, and working with custom objects as keys.

Author: Muhammad Azam
===========================================
*/

import 'dart:collection'; // Required for specialized Map implementations:
// - HashMap
// - LinkedHashMap
// - SplayTreeMap
// and other collection utilities
import 'dart:convert'; // For JSON handling example

void main() {
// ====================================================
// Section 1: Creating Maps
// ====================================================
  print('Section 1: Creating Maps');

// 1.1 Creating a Map using literal syntax
  Map<String, int> ageMap = {'Ali': 30, 'Azam': 25, 'Naeem': 35};
  print("\n1.1 Literal map: $ageMap"); // {Ali: 30, Azam: 25, Naeem: 35}

// 1.2 Creating an empty growable Map
  Map<String, dynamic> emptyMap = {};
  print("1.2 Empty map: $emptyMap"); // {}
  emptyMap['name'] = 'Imran Khan';
  print("1.2 After adding: $emptyMap"); // {name: Imran Khan}

// 1.3 Creating Map with Map constructor
  Map<int, String> idToName = Map();
  idToName[101] = 'Admin';
  idToName[102] = 'User';
  print("\n1.3 Map constructor: $idToName"); // {101: Admin, 102: User}

// 1.4 Creating LinkedHashMap (maintains insertion order)
  final orderedMap = LinkedHashMap<String, int>();
  orderedMap['First'] = 1;
  orderedMap['Second'] = 2;
  print("1.4 LinkedHashMap: $orderedMap"); // {First: 1, Second: 2}

// 1.5 Creating HashMap (unordered collection)
  final unorderedMap = HashMap<String, String>();
  unorderedMap['Apple'] = 'Red';
  unorderedMap['Banana'] = 'Yellow';
  print("1.5 HashMap: $unorderedMap"); // Order not guaranteed

// 1.6 SplayTreeMap (sorted by keys)
  // Create a SplayTreeMap with natural ordering (ascending order)
  SplayTreeMap<int, String> sortedMap = SplayTreeMap<int, String>();

  // Adding key-value pairs
  sortedMap[3] = "Three";
  sortedMap[1] = "One";
  sortedMap[2] = "Two";
  sortedMap[5] = "Five";
  sortedMap[4] = "Four";
  print("1.6 Sorted SplayTreeMap: $sortedMap"); // {1: One, 2: Two, 3: Three, 4: Four, 5: Five}

/*SplayTreeMap does not provide a direct literal initialization like {} for Map. However, you can 
initialize it in a more concise way using the constructor

var map = SplayTreeMap<int, String>.from({
    3: "Three",
    1: "One",
    2: "Two",
    5: "Five",
    4: "Four",
  });

SplayTreeMap can be initialized using `from` or a custom comparator:

var descendingMap = SplayTreeMap<int, String>.from(
    {3: "Three", 1: "One", 2: "Two", 5: "Five", 4: "Four"},
    (a, b) => b.compareTo(a), // Descending order
  );
*/

// 1.7 Map.identity() - Uses identity for equality checks
/* Map.identity() compares keys by their memory address (identity), not their values.
ANALOGY: 
Let’s say you have two identical-looking keys for a house.

One is in your pocket.
One is in your friend’s pocket.
They look the same, but they are physically separate keys.
A regular map (Map<K, V>) checks if the keys look the same.
A Map.identity() checks if they are exactly the same key (same physical object in memory).
*/

  final identityMap = Map.identity();

  var key1 = Object();
  var key2 = Object();
  var key3 = key1; // Same reference as key1

  identityMap[key1] = "Value for key1";
  identityMap[key2] = "Value for key2";
  identityMap[key3] = "Value for key3"; // Overwrites key1 since key3 is the same object

  print('1.7 ${identityMap.length}'); // 2
  print('1.7 ${identityMap[key1]}'); // Value for key3
  print('1.7 ${identityMap[key2]}'); // Value for key2
  print('1.7 key1 == key3: ${key1 == key3}'); // true

  // 1.8 Map.unmodifiable()
  final unmodifiableMap = Map.unmodifiable({'read': 'only'});
  print("1.8 Unmodifiable map: $unmodifiableMap"); //{read: only}
  // unmodifiableMap['new'] = 'value'; // Throws UnsupportedError

// ====================================================
// Section 2: Declaring Maps with Type Annotations
// ====================================================
  print('\nSection 2: Declaring Maps with Type Annotations');

// Maps in Dart can be declared with varying levels of type safety and immutability.

/*
2.1 The variable 'prices' is dynamic (Map<dynamic, dynamic>), but the literal is explicitly typed as <String, double>, 
enforcing String keys and double values only in the initial Map—not in 'prices' itself. Since 'prices' is dynamic, it can 
later be reassigned to a different key-value type.*/

  Map prices = <String, double>{'Coffee': 4.99, 'Tea': 3.49};
  prices['Cake'] = 5.99; // Valid: Adding a String key and double value
// prices[42] = 3.99;    // RUNTIME ERROR: Key type 'int' is not 'String'
// prices['Cookie'] = 'Free'; // RUNTIME ERROR: Value type 'String' is not 'double'
  print("\n2.1 Prices: $prices"); // {Coffee: 4.99, Tea: 3.49, Cake: 5.99}
  prices = {1: 'Dollar', 2: 'Euro'}; // Allowed: Variable is dynamically typed
  print("2.1 Prices after reassignment: $prices"); // {1: Dollar, 2: Euro}


//2.2 Declaration with explicit generic type on the variable:
/* In this case the variable itself 'pricesSafe' is of <String, double> type, in order to override this variable, we
have to override it with the same key value pair*/
  Map<String, double> pricesSafe = {'Coffee': 4.99, 'Tea': 3.49};
  pricesSafe['Cake'] = 5.99; // Valid
// pricesSafe['Cookie'] = 'Free'; // COMPILE ERROR: Value type 'String' is not 'double'
// pricesSafe[42] = 3.99;        // COMPILE ERROR: Key type 'int' is not 'String'
  print("2.2 Type-Safe Prices: $pricesSafe"); // {Coffee: 4.99, Tea: 3.49, Cake: 5.99}

//2.3 Declaration with explicit generic type on both the variable and the literal:
//    This is redundant but emphasizes strict type adherence. The behavior is identical to 2.2.
//    Both the variable and literal enforce String keys and double values.
  Map<String, double> pricesRedundant = <String, double>{'Coffee': 4.99, 'Tea': 3.49};
  pricesRedundant.addAll({'Cake': 5.99}); // Valid
// pricesRedundant.addAll({42: 3.99});    // COMPILE ERROR: Key/value type mismatch
  print("2.3 Redundant Typing: $pricesRedundant"); // {Coffee: 4.99, Tea: 3.49, Cake: 5.99}

// 2.4 Using 'const' to create an immutable Map:
//    The Map is fully immutable. Modifications or reassignments depend on the variable's declaration.
  Map pricesConst = const <String, double>{'Coffee': 4.99, 'Tea': 3.49};
// pricesConst['Cake'] = 5.99; // RUNTIME ERROR: Cannot modify unmodifiable Map
  print("2.4 Constant Prices: $pricesConst"); // {Coffee: 4.99, Tea: 3.49}
  pricesConst = {'New': 1.99}; // Allowed: Variable itself is not constant
  print("2.4 Constant Prices after reassignment: $pricesConst"); // {New: 1.99}

// 2.5 Fully immutable Map with const variable, No modifications or reassignments are allowed.
  const Map<String, double> fullyConstMap = {'Coffee': 4.99, 'Tea': 3.49};
// fullyConstMap['Cake'] = 5.99; // COMPILE ERROR: Cannot modify constant Map
// fullyConstMap = {'New': 1.99}; // COMPILE ERROR: Constant variables can't be reassigned
  print("2.5 Fully Constant Map: $fullyConstMap"); // {Coffee: 4.99, Tea: 3.49}

// ====================================================
// Section 3: Basic Map Operations
// ====================================================
  print('\nSection 3: Basic Operations');

  Map<String, dynamic> user = {'name': 'Sarah', 'age': 28, 'isAdmin': false};

// 3.1 Core properties
  print("\n3.1 Map length: ${user.length}"); // 3
  print("3.1 Is empty? ${user.isEmpty}"); // false

// 3.2 Adding/Updating entries
  user['email'] = 'sarah@example.com'; // Add new entry
  user['age'] = 29; // Update existing
  print("\n3.2 Updated user: $user"); //{name: Sarah, age: 29, isAdmin: false, email: sarah@example.com}

// 3.3 Removing entries
  user.remove('isAdmin');
  print("3.3 After removal: $user"); //{name: Sarah, age: 29, email: sarah@example.com}
  user.removeWhere((key, value) => key == 'email'); // Conditional removal
  print("3.3 After removeWhere: $user"); //{name: Sarah, age: 29}

// 3.4 Existence checks
  print("\n3.4 Contains key 'name'? ${user.containsKey('name')}"); // true
  print("3.4 Contains value 29? ${user.containsValue(29)}"); // true

// 3.5 Value access with null safety
  print("\n3.5 User name: ${user['name'] ?? 'Anonymous'}"); // Sarah
  print("3.5 Address: ${user['address'] ?? 'Not provided'}"); // Not provided

// 3.6 Entry-based iteration
  print("\n3.6 Map entries:");

  user.entries.forEach((entry) => print("${entry.key}: ${entry.value}")); // name: Sarah, age: 29

// ====================================================
// Section 4: Map Constructors and Copying
// ====================================================
  print('\nSection 4: Constructors and Copying');

// 4.1 Map.from() - Runtime type checking
  Map<String, int> fromMap = Map.from(ageMap);
  print("\n4.1 Map.from(): $fromMap"); //{Ali: 30, Azam: 25, Naeem: 35}

// 4.2 Map.of() - Compile-time type safety
  Map<String, int> ofMap = Map.of(ageMap);
  print("4.2 Map.of(): $ofMap"); //{Ali: 30, Azam: 25, Naeem: 35}

// 4.3 Map.fromIterables() - Parallel lists
  List<String> keys = ['A', 'B'];
  List<int> values = [1, 2];
  Map<String, int> iterablesMap = Map.fromIterables(keys, values);
  print("\n4.3 From iterables: $iterablesMap"); // {A: 1, B: 2}

// 4.4 Map.fromEntries()
  Map<String, int> entryMap = Map.fromEntries([
    MapEntry('A', 1),
    MapEntry('B', 2),
  ]);
  print("4.4 From entries: $entryMap"); // {A: 1, B: 2}

  // 4.5 Map.fromIterable() - Create from single iterable
  List<String> fruits = ['Apple', 'Banana'];
  Map<String, int> fruitLengths = Map.fromIterable(
    fruits,
    key: (item) => item,
    value: (item) => item.length,
  );
  print("\n4.5 FromIterable: $fruitLengths"); // {Apple: 5, Banana: 6}

// ====================================================
// Section 5: Advanced Map Operations
// ====================================================
  print('\nSection 5: Advanced Operations');

  Map<String, num> stock = {'AAPL': 189.84, 'GOOGL': 138.21, 'MSFT': 332.01};

// 5.1 putIfAbsent (callback executes only if key missing)
  stock.putIfAbsent('TSLA', () => 260.54);
  print("\n5.1 After putIfAbsent: $stock"); // {AAPL: 189.84, GOOGL: 138.21, MSFT: 332.01, TSLA: 260.54}

// 5.2 update() with existence check
  stock.update('GOOGL', (v) => v * 1.05, ifAbsent: () => 0);
  print("5.2 Updated GOOGL: ${stock['GOOGL']}"); // 145.1205

// 5.3 Bulk updates
  stock.updateAll((key, value) => value * 1.1);
  print("\n5.3 After 10% increase: $stock"); // {AAPL: 208.824, GOOGL: 159.63255, MSFT: 365.211, TSLA: 286.594}

// 5.4 Map transformation
  Map<String, String> stringStock = stock.map((k, v) => MapEntry(k, "\$${v.toStringAsFixed(2)}"));
  print("5.4 Transformed map: $stringStock"); // {AAPL: $208.82, GOOGL: $159.63, MSFT: $365.21, TSLA: $286.59}

// 5.5 Spread operator
  Map<String, num> newStocks = {'AMZN': 128.44, 'NVDA': 452.94};
  Map<String, num> combined = {...stock, ...newStocks};
  print("\n5.5 Combined map: $combined"); // {AAPL: 208.824, GOOGL: 159.63255, MSFT: 365.211, TSLA: 286.594, AMZN: 128.44, NVDA: 452.94}

// 5.6 Merging with conflict resolution
  Map<String, int> scores1 = {'Math': 90, 'Science': 85}; 
  Map<String, int> scores2 = {'Science': 88, 'History': 92};

// Simple merge (last wins)
  Map<String, int> combinedScores = {...scores1, ...scores2};
  print("\n5.6 Simple merge: $combinedScores"); // {Math: 90, Science: 88, History: 92}

// Custom merge function
  combinedScores = {};
  scores1.forEach((key, value) => combinedScores[key] = (combinedScores[key] ?? 0) + value);
  scores2.forEach((key, value) => combinedScores[key] =
          (combinedScores[key] ?? 0) + value 
      );
  print("5.6 Summed merge: $combinedScores"); // {Math: 90, Science: 173, History: 92}

  // Using update method for merging
  void mergeValues(Map<String, int> target, Map<String, int> source) {
    source.forEach((key, value) {
      target.update(key, (existing) => existing + value, ifAbsent: () => value);
    });
  }

  Map<String, int> mergedScores = {};
  mergeValues(mergedScores, scores1);
  mergeValues(mergedScores, scores2);
  print("5.6 Merged with update: $mergedScores");

// ====================================================
// Section 6: Performance and Equality
// ====================================================
  print('\nSection 6: Performance & Equality');

// 6.1 Map equality
  Map a = {1: 'A'}, b = {1: 'A'};
  print("\n6.1 Map equality: ${a == b}"); // true

// 6.2 Performance characteristics
  print("""
  Performance Guide:
  - HashMap: O(1) lookups, no order
  - LinkedHashMap: O(1) lookups, insertion order
  - SplayTreeMap: O(log n) operations, sorted keys
  """);

// 6.3 Sorting with SplayTreeMap
  final unsortedMap = {'Z': 3, 'A': 1, 'B': 2};
  final sortedByKey = SplayTreeMap.from(unsortedMap);
  print("\n6.3 Sorted map: $sortedByKey"); // {A: 1, B: 2, Z: 3}

// 6.4 Detailed implementation differences
  print("""
  Implementation Details:
  - HashMap: Uses hash table with O(1) average complexity
    - Best for maximum speed when order doesn't matter
    - Collisions handled through chaining
    
  - LinkedHashMap: Combines hash table with linked list
    - Maintains insertion order
    - Slightly higher memory overhead
    
  - SplayTreeMap: Self-balancing binary search tree
    - O(log n) operations
    - Automatically sorts keys
    - Best for frequent ordered access patterns
  """);

//  6.5 Performance comparison example
  final hashMap = HashMap<int, String>(); // Explicit type parameters
  final linkedMap = LinkedHashMap<int, String>();
  final splayMap = SplayTreeMap<int, String>();

  void fillMap(Map<int, String> m) {
    for (int i = 0; i < 1000; i++) {
      m[i] = 'Value $i';
    }
  }

  final stopwatch = Stopwatch();

  // Test HashMap
  stopwatch.start();
  fillMap(hashMap);
  stopwatch.stop(); 
  print("\n6.5 HashMap insertion time: ${stopwatch.elapsedMicroseconds}μs"); // 150μs (actual time may vary on runtime)

  // Test LinkedHashMap
  stopwatch.reset();
  stopwatch.start();
  fillMap(linkedMap);
  stopwatch.stop();
  print("6.5 LinkedHashMap insertion time: ${stopwatch.elapsedMicroseconds}μs");// 120μs (actual time may vary on runtime)

  // Test SplayTreeMap
  stopwatch.reset();
  stopwatch.start();
  fillMap(splayMap);
  stopwatch.stop();
  print("6.5 SplayTreeMap insertion time: ${stopwatch.elapsedMicroseconds}μs"); // 450μs (actual time may vary on runtime)

// ====================================================
// Section 7: Real-World Use Cases
// ====================================================
  print('\nSection 7: Practical Applications');

// 7.1 JSON handling
  final jsonString = '{"name": "Ali", "age": 30}';
  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  print("\n7.1 JSON name: ${jsonData['name']}"); // Ali

// 7.2 Data transformation
  List<Map<String, dynamic>> users = [
    {'id': 1, 'name': 'Ali'},
    {'id': 2, 'name': 'Babar'}
  ];
  Map<int, String> userIdToName = {
  for (var user in users) user['id'] ?? 0: user['name'] ?? 'Unknown'
};
  print("7.2 ID map: $userIdToName "); // {1: Ali, 2: Babar}

// 7.3 Configuration map
  final config = const {
    'apiUrl': 'https://api.example.com',
    'timeout': Duration(seconds: 30),
    'retries': 3
  };
  print("\n7.3 Timeout: ${config['timeout']}"); // Timeout: Duration(seconds: 30)

// ====================================================
// Section 8: Custom Object Keys
// ====================================================
  print('\nSection 8: Custom Keys');

  // WARNING: Mutable keys can cause lookup failures
  print("\n8.1 Product P1: ${inventory[Product('P1')]}"); // Laptop

  // 8.2 Mutable key demonstration
  final mutableKey = MutableKey('original');
  final mutableKeyMap = {mutableKey: 'secret'};
  print("\n8.2 Original value: ${mutableKeyMap[mutableKey]}"); // secret
  mutableKey.value = 'modified';
  print("8.2 After mutation: ${mutableKeyMap[mutableKey]}"); // null

// 8.3 Modification during iteration error
  print("\n8.3 Modification during iteration:");
  final modMap = {'a': 1, 'b': 2, 'c': 3};
  try {
    modMap.forEach((key, value) {
      print("Processing $key");
      if (key == 'b') modMap.remove('c'); // Concurrent modification
    });
  } catch (e) {
    print("Error caught: $e"); // Error caught: Concurrent modification during iteration
  }

// 8.4 Best practice: Immutable keys
  final immutableMap = {const ImmutableKey('safe'): 'data'};
  print("8.4 Immutable key access: ${immutableMap[const ImmutableKey('safe')]}"); // data

// ====================================================
// Section 9: Cheat Sheet
// ====================================================
  print("""
  
  Map Cheat Sheet:
  * Special Constructors:
    - Map.identity(): Uses identity equality
    - Map.unmodifiable(): Creates read-only map
    - Map.fromIterable(): Builds from single iterable
  
  * Merging Strategies:
    - Spread operator (...): Last duplicate wins
    - update(): Custom conflict resolution
    - Manual merging: Full control over collisions
  
  * Performance Guide:
    - HashMap: Fastest lookups, no order
    - LinkedHashMap: Fast lookups, insertion order
    - SplayTreeMap: Sorted keys, good for ranges
  
  * Best Practices:
    - Use immutable keys
    - Avoid modification during iteration
    - Choose map type based on access patterns
    - Handle key collisions explicitly
  """);
}

class Product {
  final String id;
  Product(this.id);

  @override
  bool operator ==(Object o) => o is Product && id == o.id;
  @override
  int get hashCode => id.hashCode;
}

Map<Product, String> inventory = {
  Product('P1'): 'Laptop',
  Product('P2'): 'Phone'
};

class MutableKey {
  String value;
  MutableKey(this.value);

  @override
  bool operator ==(Object o) => o is MutableKey && value == o.value;
  @override
  int get hashCode => value.hashCode;
}

class ImmutableKey {
  final String id;
  const ImmutableKey(this.id);

  @override
  bool operator ==(Object o) => o is ImmutableKey && id == o.id;
  @override
  int get hashCode => id.hashCode;
}
