/*
===========================
 Topic: Interfaces in Dart
===========================
 - Dart does not have a separate "interface" keyword.
 - Instead, any class can be used as an interface.
 - Key Points:
   ✅ A class can implement one or multiple interfaces using "implements".
   ✅ When a class implements an interface, it must override all of its methods.
   ✅ Unlike "extends", "implements" does not inherit method implementations.
   ✅ Interfaces provide structure and enforce method implementation.
===========================
*/

// 1️⃣ Defining an Interface (Normal Class)
abstract class Animal {
  // Abstract Method (Without Implementation)
  void makeSound();

  // Concrete Method (With Implementation)
  void info() {
    print("This is an animal.");
  }
}

// 2️⃣ Implementing the Interface in Dog Class
class Dog implements Animal {
  @override
  void makeSound() {
    print("Dog barks: Woof! Woof!");
  }

  @override
  void info() {
    print("This is a dog.");
  }
}

// 3️⃣ Implementing the Interface in Cat Class
class Cat implements Animal {
  @override
  void makeSound() {
    print("Cat meows: Meow! Meow!");
  }

  @override
  void info() {
    print("This is a cat.");
  }
}

// 4️⃣ Main Function to Demonstrate Interfaces
void main() {
  // Creating Objects of Dog and Cat
  Dog dog = Dog();
  Cat cat = Cat();

  // Accessing Methods
  dog.info(); //This is a dog.
  dog.makeSound(); //Dog barks: Woof! Woof!

  cat.info(); //This is a cat.
  cat.makeSound(); //Cat meows: Meow! Meow!
}
