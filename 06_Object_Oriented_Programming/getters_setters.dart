/*
===========================================
Topic: Getters and Setters in Dart
===========================================
- This program demonstrates the use of getters and setters in Dart.
- Key Points:
  ✅ Getters allow controlled access to private fields.
  ✅ Setters provide a way to modify private fields with validation.
  ✅ Encapsulation is achieved using private variables with getters and setters.
===========================================
*/

void main() {
  // Creating an instance of Person
  Person person = Person();

  // Setting values using setters
  person.name = 'Azam';
  person.age = 27;

  // Getting values using getters
  print('Name: ${person.name}');
  print('Age: ${person.age}');
}

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
