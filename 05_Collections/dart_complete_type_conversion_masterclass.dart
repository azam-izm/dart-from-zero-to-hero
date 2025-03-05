import 'dart:convert'; // Needed only for JSON conversions
// This library is specifically imported for:
// - Converting JSON strings to objects (jsonDecode)
// - Serializing objects to JSON strings (jsonEncode)
// Everything else works with Dart's normal features

/*
============================================
 Dart Data Type Conversion Masterclass
============================================

A comprehensive demonstration of bidirectional conversions between all major
Dart data types, showcasing best practices for type transformations.

Covers:
- Primitive types (int, double, bool, String)
- Collection types (List, Set, Map)
- JSON serialization/deserialization
- Type casting and parsing techniques

Key Features:
1. 50+ conversion examples covering all possible type combinations
2. Bidirectional conversions (A → B → A)
3. JSON encoding/decoding examples
4. Best practice implementations
5. Error-free conversion patterns
6. Complete output demonstration

Author: Muhammad Azam

*/

void main() {
  // Original values
  int originalInt = 42;
  double originalDouble = 3.14;
  String originalString = '123';
  bool originalBool = true;
  List<int> originalList = [1, 2, 3];
  Set<int> originalSet = {4, 5, 6};
  Map<String, dynamic> originalMap = {'name': 'Azam', 'age': 27};

  // ----------------------------
  // Int Conversions
  // ----------------------------
  // Int to Double
  double intToDouble = originalInt.toDouble(); // Output: intToDouble: 42.0
  int doubleBackToInt = intToDouble.toInt(); // Output: doubleBackToInt: 42

  // Int to String
  String intToString = originalInt.toString(); // Output: intToString: 42
  int stringBackToInt = int.parse(intToString); // Output: stringBackToInt: 42

  // Int to Bool
  bool intToBool = originalInt != 0; // Output: intToBool: true
  int boolBackToInt = intToBool ? 1 : 0; // Output: boolBackToInt: 1

  // Int to List
  List<int> intToList = [originalInt]; // Output: intToList: [42]
  int listBackToInt = intToList.first; // Output: listBackToInt: 42
  //OR
  //int listBackToInt = intToList[0]; // Output: listBackToInt: 42

  // Int to Set
  Set<int> intToSet = {originalInt}; // Output: intToSet: {42}
  int setBackToInt = intToSet.first; // Output: setBackToInt: 42

  // Int to Map
  Map<String, int> intToMap = {'value': originalInt}; // Output: intToMap: {value: 42}
  int mapBackToInt = intToMap['value']!; // Output: mapBackToInt: 42    
 /*  ! is necessary here because intToMap['values'] can return null if the key doesn’t exist. To avoid compile-time erros, 
 either make mapBackToInt nullable (int?) or use ! to assert it's non-null.*/

  // ----------------------------
  // Double Conversions
  // ----------------------------

  // Double to Int
  int doubleToInt = originalDouble.toInt(); // Output: doubleToInt: 3
  double intBackToDouble = doubleToInt.toDouble(); // Output: intBackToDouble: 3.0

  // Double to String
  String doubleToString = originalDouble.toString(); // Output: doubleToString: 3.14
  double stringBackToDouble = double.parse(doubleToString); // Output: stringBackToDouble: 3.14

  // Double to Bool
  bool doubleToBool = originalDouble != 0; // Output: doubleToBool: true
  double boolBackToDouble = doubleToBool ? 1.0 : 0.0; // Output: boolBackToDouble: 1.0

  // Double to List
  List<double> doubleToList = [originalDouble]; // Output: doubleToList: [3.14]
  double listBackToDouble = doubleToList.first; // Output: listBackToDouble: 3.14
  //OR
  // double listBackToDouble = doubleToList[0]; // Output: listBackToDouble: 3.14

  // Double to Set
  Set<double> doubleToSet = {originalDouble}; // Output: doubleToSet: {3.14}
  double setBackToDouble = doubleToSet.first; // Output: setBackToDouble: 3.14

  // Double to Map
  Map<String, double> doubleToMap = {'value': originalDouble}; // Output: doubleToMap: {value: 3.14}
  double mapBackToDouble = doubleToMap['value']!; // Output: mapBackToDouble: 3.14

  // ----------------------------
  // String Conversions
  // ----------------------------
  // String to Int
  int stringToInt = int.parse(originalString); // Output: stringToInt: 123
  String intBackToString = stringToInt.toString(); // Output: intBackToString: 123

  // String to Double
  double stringToDouble = double.parse(originalString); // Output: stringToDouble: 123.0
  String doubleBackToString = stringToDouble.toString(); // Output: doubleBackToString: 123.0

  // String to Bool
  bool stringToBool = originalString.toLowerCase() == 'true'; // Output: stringToBool: false
  String boolBackToString = stringToBool.toString(); // Output: boolBackToString: false

  // String to List (Characters)
  List<String> stringToList = originalString.split(''); // Output: stringToList: [1, 2, 3]
  String listBackToString = stringToList.join(); // Output: listBackToString: 123

  // String to Set (Characters)
  Set<String> stringToSet = originalString.split('').toSet(); // Output: stringToSet: {1, 2, 3}
  String setBackToString = stringToSet.join(); // Output: setBackToString: 123

 /*
  String to Map (JSON)
  Condition: The string must be a valid JSON object where:
  1. Keys must always be Strings.
     - In JSON, keys must be enclosed in double quotes ("key"), not single quotes ('key').
     - Single quotes for keys will result in a **FormatException** when decoding the string.

  2. Values can be of any type (dynamic).
     If the input JSON is not in the correct format, a FormatException will occur.
     Example: `jsonDecode` expects keys to be Strings, and values can be numbers, booleans, or other JSON-encoded objects. 
  
                        Example of a valid JSON string 👇
  */
  Map<String, dynamic> stringToMap = jsonDecode('{"key": "value"}'); // Output: stringToMap: {key: value}  
  // The output will be a Map where keys are always Strings, and values are dynamic (i.e., can be any data type).

  /* 
  Map to JSON String
  Condition: The map must have:
  1. Keys should always be Strings (as JSON keys must be strings).
  2. Values can be of any type (dynamic). The JSON format supports numbers, strings, booleans, arrays, and other JSON objects.
     
     If you use non-String keys (e.g., integers, booleans) in the map, `jsonEncode` will throw a TypeError.
     This is because JSON keys must be strings, and Dart's `jsonEncode` requires the map's keys of type String.
   
    Example of a valid JSON Map 👉 {key: value} 
  */
  String mapBackToString = jsonEncode(stringToMap); // Output: mapBackToString: {"key":"value"}

  // ----------------------------
  // Bool Conversions
  // ----------------------------
  // Bool to Int
  int boolToInt = originalBool ? 1 : 0; // Output: boolToInt: 1
  bool intBackToBool = boolToInt != 0; // Output: intBackToBool: true

  // Bool to Double
  double boolToDouble = originalBool ? 1.0 : 0.0; // Output: boolToDouble: 1.0
  bool doubleBackToBool = boolToDouble != 0; // Output: doubleBackToBool: true

  // Bool to String
  String boolToString = originalBool.toString(); // Output: boolToString: true
  bool stringBackToBool = boolToString.toLowerCase() == 'true'; // Output: stringBackToBool: true

  // Bool to List
  List<bool> boolToList = [originalBool]; // Output: boolToList: [true]
  bool listBackToBool = boolToList.first; // Output: listBackToBool: true
  //OR
  // bool listBackToBool = boolToList[0]; // Output: listBackToBool: true

  // Bool to Set
  Set<bool> boolToSet = {originalBool}; // Output: boolToSet: {true}
  bool setBackToBool = boolToSet.first; // Output: setBackToBool: true

  // Bool to Map
  Map<String, bool> boolToMap = {'value': originalBool}; // Output: boolToMap: {value: true}
  bool mapBackToBool = boolToMap['value']!; // Output: mapBackToBool: true

  // ----------------------------
  // List Conversions
  // ----------------------------
  // List to Int (Length)
  int listToInt = originalList.length; // Output: listToInt: 3
  List<int> intBackToList = List.generate(listToInt, (index) => index); // Output: intBackToList: [0, 1, 2]

  // List to Double (Length)
  double listToDouble = originalList.length.toDouble(); // Output: listToDouble: 3.0
  List<double> doubleBackToList = [listToDouble]; // Output: doubleBackToList: [3.0]

  // List to String (JSON)
  String listToString = jsonEncode(originalList); // Output: listToString: [1,2,3]
  /* jsonDecode returns a dynamic type, so using List<int> will result in a type error. 
  Use List<dynamic> even if you are sure the list contains only int values.*/
  List<dynamic> stringBackToList = jsonDecode(listToString); // Output: stringBackToList: [1, 2, 3]

  // List to Bool
  bool listToBool = originalList.isNotEmpty; // Output: listToBool: true
  List<bool> boolBackToList = [listToBool]; // Output: boolBackToList: [true]

  // List to Set
  Set<int> listToSet = originalList.toSet(); // Output: listToSet: {1, 2, 3}
  List<int> setBackToList = listToSet.toList(); // Output: setBackToList: [1, 2, 3]

  // List to Map (Index as Key)
  Map<int, int> listToMap = originalList.asMap(); // Output: listToMap: {0: 1, 1: 2, 2: 3}
  List<int> mapBackToList = listToMap.values.toList(); // Output: mapBackToList: [1, 2, 3]

  // ----------------------------
  // Set Conversions
  // ----------------------------
  // Set to Int (Length)
  int setToInt = originalSet.length; // Output: setToInt: 3
  Set<int> intBackToSet = Set.from(List.generate(setToInt, (index) => index)); // Output: intBackToSet: {0, 1, 2}

  // Set to Double (Length)
  double setToDouble = originalSet.length.toDouble(); // Output: setToDouble: 3.0
  Set<double> doubleBackToSet = {setToDouble}; // Output: doubleBackToSet: {3.0}

  // Set to String (JSON)
  String setToString = jsonEncode(originalSet.toList()); // Output: setToString: [4,5,6]
  Set<dynamic> stringBackToSet = Set.from(jsonDecode(setToString)); // Output: stringBackToSet: {4, 5, 6}

  // Set to Bool
  bool setToBool = originalSet.isNotEmpty; // Output: setToBool: true
  Set<bool> boolBackToSet = {setToBool}; // Output: boolBackToSet: {true}

  // Set to List
  List<int> setToList = originalSet.toList(); // Output: setToList: [4, 5, 6]
  Set<int> listBackToSet = setToList.toSet(); // Output: listBackToSet: {4, 5, 6}

  // Set to Map (Element as Key)
  Map<int, int> setToMap = Map.fromEntries(originalSet.map((e) => MapEntry(e, e))); // Output: setToMap: {4: 4, 5: 5, 6: 6}
  Set<int> mapBackToSet = setToMap.keys.toSet(); // Output: mapBackToSet: {4, 5, 6}

  // ----------------------------
  // Map Conversions
  // ----------------------------
  // Map to Int (Length)
  int mapToInt = originalMap.length; // Output: mapToInt: 2
  Map<String, int> intBackToMap = {'length': mapToInt}; // Output: intBackToMap: {length: 2}

  // Map to Double (Length)
  double mapToDouble = originalMap.length.toDouble(); // Output: mapToDouble: 2.0
  Map<String, double> doubleBackToMap = {'length': mapToDouble}; // Output: doubleBackToMap: {length: 2.0}

  // Map to String (JSON)
  String mapToString = jsonEncode(originalMap); // Output: mapToString: {"name":"Azam","age":27}
  Map<String, dynamic> stringBackToMap = jsonDecode(mapToString); // Output: stringBackToMap: {name: Azam, age: 27}

  // Map to Bool
  bool mapToBool = originalMap.isNotEmpty; // Output: mapToBool: true
  Map<String, bool> boolBackToMap = {'value': mapToBool}; // Output: boolBackToMap: {value: true}

  // Map to List (Entries)
  List<MapEntry<String, dynamic>> mapToList = originalMap.entries.toList(); // Output: mapToList: [MapEntry(name: Azam), MapEntry(age: 27)]
  Map<String, dynamic> listBackToMap = Map.fromEntries(mapToList); // Output: listBackToMap: {name: Azam, age: 27}

  // Map to Set (Entries)
  Set<MapEntry<String, dynamic>> mapToSet = originalMap.entries.toSet(); // Output: mapToSet: {MapEntry(name: Azam), MapEntry(age: 27)}
  Map<String, dynamic> setBackToMap = Map.fromEntries(mapToSet); // Output: setBackToMap: {name: Azam, age: 27}

  // ========================
  // Print All Conversions
  // ========================
  print('=== Int Conversions ===');
  print('intToDouble: $intToDouble');
  print('doubleBackToInt: $doubleBackToInt');
  print('intToString: $intToString');
  print('stringBackToInt: $stringBackToInt');
  print('intToBool: $intToBool');
  print('boolBackToInt: $boolBackToInt');
  print('intToList: $intToList');
  print('listBackToInt: $listBackToInt');
  print('intToSet: $intToSet');
  print('setBackToInt: $setBackToInt');
  print('intToMap: $intToMap');
  print('mapBackToInt: $mapBackToInt\n');

  print('=== Double Conversions ===');
  print('doubleToInt: $doubleToInt');
  print('intBackToDouble: $intBackToDouble');
  print('doubleToString: $doubleToString');
  print('stringBackToDouble: $stringBackToDouble');
  print('doubleToBool: $doubleToBool');
  print('boolBackToDouble: $boolBackToDouble');
  print('doubleToList: $doubleToList');
  print('listBackToDouble: $listBackToDouble');
  print('doubleToSet: $doubleToSet');
  print('setBackToDouble: $setBackToDouble');
  print('doubleToMap: $doubleToMap');
  print('mapBackToDouble: $mapBackToDouble\n');

  print('=== String Conversions ===');
  print('stringToInt: $stringToInt');
  print('intBackToString: $intBackToString');
  print('stringToDouble: $stringToDouble');
  print('doubleBackToString: $doubleBackToString');
  print('stringToBool: $stringToBool');
  print('boolBackToString: $boolBackToString');
  print('stringToList: $stringToList');
  print('listBackToString: $listBackToString');
  print('stringToSet: $stringToSet');
  print('setBackToString: $setBackToString');
  print('stringToMap: $stringToMap');
  print('mapBackToString: $mapBackToString\n');

  print('=== Bool Conversions ===');
  print('boolToInt: $boolToInt');
  print('intBackToBool: $intBackToBool');
  print('boolToDouble: $boolToDouble');
  print('doubleBackToBool: $doubleBackToBool');
  print('boolToString: $boolToString');
  print('stringBackToBool: $stringBackToBool');
  print('boolToList: $boolToList');
  print('listBackToBool: $listBackToBool');
  print('boolToSet: $boolToSet');
  print('setBackToBool: $setBackToBool');
  print('boolToMap: $boolToMap');
  print('mapBackToBool: $mapBackToBool\n');

  print('=== List Conversions ===');
  print('listToInt: $listToInt');
  print('intBackToList: $intBackToList');
  print('listToDouble: $listToDouble');
  print('doubleBackToList: $doubleBackToList');
  print('listToString: $listToString');
  print('stringBackToList: $stringBackToList');
  print('listToBool: $listToBool');
  print('boolBackToList: $boolBackToList');
  print('listToSet: $listToSet');
  print('setBackToList: $setBackToList');
  print('listToMap: $listToMap');
  print('mapBackToList: $mapBackToList\n');

  print('=== Set Conversions ===');
  print('setToInt: $setToInt');
  print('intBackToSet: $intBackToSet');
  print('setToDouble: $setToDouble');
  print('doubleBackToSet: $doubleBackToSet');
  print('setToString: $setToString');
  print('stringBackToSet: $stringBackToSet');
  print('setToBool: $setToBool');
  print('boolBackToSet: $boolBackToSet');
  print('setToList: $setToList');
  print('listBackToSet: $listBackToSet');
  print('setToMap: $setToMap');
  print('mapBackToSet: $mapBackToSet\n');

  print('=== Map Conversions ===');
  print('mapToInt: $mapToInt');
  print('intBackToMap: $intBackToMap');
  print('mapToDouble: $mapToDouble');
  print('doubleBackToMap: $doubleBackToMap');
  print('mapToString: $mapToString');
  print('stringBackToMap: $stringBackToMap');
  print('mapToBool: $mapToBool');
  print('boolBackToMap: $boolBackToMap');
  print('mapToList: $mapToList');
  print('listBackToMap: $listBackToMap');
  print('mapToSet: $mapToSet');
  print('setBackToMap: $setBackToMap');
}
