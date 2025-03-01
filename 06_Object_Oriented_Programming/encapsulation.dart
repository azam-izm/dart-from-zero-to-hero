/*
Encapsulation in Dart – Comprehensive Lecture
=============================================

Definition: Encapsulation is the process of wrapping data (variables) and the methods that work on that 
data into a single structured unit, typically a class, and controlling access to it.

Purpose: It protects the internal data of a class by restricting direct access and provides controlled 
access through public methods (getters/setters).

Key Concepts:
-------------
• Private Members: _prefix for library-level privacy
• Getter/Setter: Controlled property access
• Read-Only: Final fields + public getter
• Write-Only: Private field + setter (no getter)
• Immutable Objects: Final initialization + no setters

Access Modifiers in Dart:
-------------------------
┌─────────────┬───────────────────────────────┐
│ Modifier    │ Scope                         │
├─────────────┼───────────────────────────────┤
│ No prefix   │ Public (library-level access) │
│ _prefix     │ Private (library-level only)  │
└─────────────┴───────────────────────────────┘
*/


class Person {
// Private fields (Encapsulation)
  String _name = '';
  int _age = 0;

  // Getter for name
  String get name => _name; // OR 👇
  //String get name {return _name;}
  //String name()=> _name; //calling it requires parenthesis

  // Setter for name
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    } else {
      print('Error: Name cannot be empty.');
    }
  }

  // Getter for age
  int get age => _age; // OR 👇
  //int get age {return _age;}
  //int age()=> _age; calling it requires parenthesis

  // Setter for age (with validation)
  set age(int newAge) {
    if (newAge > 0) {
      _age = newAge;
    } else {
      print('Error: Age must be positive.');
    }
  }
}

void main() {
  // Creating an instance of Person
  Person person = Person();

  // Setting values using setters
  person.name = 'Azam';
  person.age = 27;

  // Getting values using getters
  print('Name: ${person.name}'); //Output: Name: Azam
  print('Age: ${person.age}');   //Output: Age: 27
}
