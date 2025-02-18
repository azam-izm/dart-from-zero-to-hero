/*
===========================================
 Topic: Parameter Types in Dart
===========================================
 In Dart, functions support different types of parameters that allow for flexibility and clarity in code. Understanding these parameters is crucial for writing efficient and readable Dart functions.

Parameter Types in Dart
 ├── Positional Parameters
 │    ├── Required Positional Parameters   (Type parameter)
 │    └── Optional Positional Parameters   ([Type? parameter]) OR ([Type parameter = defaultValue])
 └── Named Parameters
      ├── Required Named Parameters        ({required Type parameter})
      └── Optional Named Parameters        ({Type? parameter}) OR ({Type parameter = defaultValue})
 
 - **Positional parameters** are defined by their position in the function's parameter list. They can either be required or optional.
 - **Named parameters** are defined by explicitly specifying the name of the parameter when calling the function. These parameters can be required or optional as well.
===========================================
*/

// 1.1 Required Positional Parameters
String fullName(String firstName, String lastName) {
  return "$firstName $lastName";
}

// 1.2 Optional Positional Parameters (Null safety: If no argument is passed, it can be null)
void greet(String name, [String? greeting]) {
  greeting =
      greeting ?? "Hello"; // Default value is used if greeting is not passed
  print("$greeting $name");
}

// 1.3 Optional Positional Parameters (Default value if no argument is passed)
void greetWithDefault(String name, [String greeting = "Hello"]) {
  print("$greeting $name");
}

// 2.1 Required Named Parameters
String userInfo({required String name, required int age}) {
  return "Name: $name, Age: $age";
}

// 2.2 Optional Named Parameters (Null safety: Parameter is optional and can be null)
String greetUser(String name, {String? greeting}) {
  greeting = greeting ?? "Hello"; // Default value if not provided
  return "$greeting $name, Welcome!";
}

// 2.3 Optional Named Parameters (Default value if no argument is passed)
String greetUserWithDefault(String name, {String greeting = "Hello"}) {
  return "$greeting $name, Welcome!";
}

// Mix of All Parameter Types (Positional + Named)
String fullUserDetails(String name, int age,
    {required String city, String? greeting, String description = "Unknown"}) {
  return "Name: $name, Age: $age, City: $city, Greeting: $greeting, Description: $description";
}

void main() {
  // 1.1 Required Positional Parameters
  print("Required Positional Parameters:");
  print(fullName("Muhammad", "Azam")); // Output: Muhammad Azam
  print(""); // Space for separation

  // 1.2 Optional Positional Parameters (Null safety: If no argument is passed, it can be null)
  print("Optional Positional Parameters (Null safety):");
  greet("Azam"); // Output: Hello Azam
  //(No second parameter passed, default greeting is used)
  greet("Umar", "Good Morning"); // Output: Good Morning Umar
  greet("Ali", "Welcome"); // Output: Welcome Ali
  print(""); // Space for separation

  // 1.3 Optional Positional Parameters (Default value if no argument is passed)
  print("Optional Positional Parameters (Default value):");
  greetWithDefault("Azam"); // Output: Hello Azam (Uses default greeting)
  greetWithDefault("Ali", "Good Evening"); // Output: Good Evening Ali
  print(""); // Space for separation

  // 2.1 Required Named Parameters
  print("Required Named Parameters:");
  print(userInfo(name: "Umar", age: 28)); // Output: Name: Umar, Age: 28
  print(""); // Space for separation

  // 2.2 Optional Named Parameters (Null safety: Parameter is optional and can be null)
  print("Optional Named Parameters (Null safety):");
  print(greetUser("Azam")); // Output: Hello Azam, Welcome! (No greeting passed, uses default value)
  print(greetUser("Umar", greeting: "Good Morning")); // Output: Good Morning Umar, Welcome!
  print(""); // Space for separation

  // 2.3 Optional Named Parameters (Default value if no argument is passed)
  print("Optional Named Parameters (Default value):");
  print(greetUserWithDefault("Azam")); // Output: Hello Azam, Welcome! (Uses default greeting)
  print(greetUserWithDefault("Umar", greeting: "Good Evening")); // Output: Good Evening Umar, Welcome!
  print(""); // Space for separation

  // Mix of All Parameter Types (Positional + Named)
  print("Mix of All Parameter Types (Positional + Named):");
  print(fullUserDetails("Azam", 27, city: "Lahore", greeting: "Good Morning")); // Output: Name: Azam, Age: 27, City: Lahore, Greeting: Good Morning
  print(fullUserDetails("Umar", 28, city: "Karachi")); // Output: Name: Umar, Age: 28, City: Karachi, Greeting: Hello
  print(fullUserDetails("Ali", 22, city: 'Islamabad')); // Output: Name: Ali, Age: 22, City: Unknown, Greeting: Hello
  print(""); // Space for separation
}
