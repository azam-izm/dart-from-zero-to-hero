/*
Polymorphism in Dart – Complete Mastery Guide
============================================

Definition: 
Polymorphism means "many forms". It allows one object to take on many forms, enabling the 
same method to behave differently based on the object type.

Types of Polymorphism:
  1. Compile-time Polymorphism (Method Overloading): 
  - Allows methods with same name but different parameters. 
  - Not supported in Dart.

  2. Runtime Polymorphism (Method Overriding):
     - Subclasses override superclass methods.
     - Supported in Dart via inheritance (`extends`) and `@override`.

Key Benefit: It enables flexibility and reuse of code, allowing objects to be treated based on their common 
interface, while behaving according to their actual type.
*/


/*
===========================================
1. Runtime Polymorphism (Method Overriding)
===========================================
- Achieved through class inheritance
- Subclasses provide specific implementation of superclass methods
- @override annotation ensures intentional overriding
*/

class Animal {
  // Base class method to be overridden
  void makeSound() {
    print("Generic animal sound");
  }
}

class Dog extends Animal {
  @override // Explicitly marks method overriding
  void makeSound() {
    print("Woof!"); // Specialized implementation for Dog
  }

  // Unique method to Dog class
  void fetch() {
    print("Fetching stick...");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!"); // Specialized implementation for Cat
  }
}

void runtimePolymorphismDemo() {
  print("=== 1. Runtime Polymorphism ===");
  Animal myPet = Dog(); // Treat Dog as Animal type
  myPet.makeSound(); // Output: Woof! 

  myPet = Cat(); // Switch to Cat instance
  myPet.makeSound(); // Output: Meow!
}

/*
===========================
2. Interface Polymorphism
===========================

Dart's implicit interfaces allow different implementations 
to satisfy the same interface contract
*/

abstract class Shape {
  // Interface definition
  double area(); // Abstract method signature
}

class Circle implements Shape {
  // Implements interface
  final double radius;

  Circle(this.radius); // Constructor with radius

  @override
  double area() => 3.1416 * radius * radius; // Circle-specific calculation
}

class Square implements Shape {
  // Same interface different implementation
  final double side;

  Square(this.side); // Constructor with side length

  @override
  double area() => side * side; // Square area calculation
}

void interfacePolymorphismDemo() {
  print("\n=== 2. Interface Polymorphism ===");
  List<Shape> shapes = [Circle(5), Square(5)]; // Heterogeneous collection

  shapes.forEach((shape) {
    // Process different shapes uniformly
    print("Area: ${shape.area().toStringAsFixed(1)}");
    // Output: 78.5 (Circle) and 25.0 (Square)
  });
}


// ==================
// Main Demonstration
// ==================
void main() {
  runtimePolymorphismDemo(); // Section 1
  interfacePolymorphismDemo(); // Section 2
}

/*
EXPECTED OUTPUT:
================
=== 1. Runtime Polymorphism ===
Woof!
Meow!

=== 2. Interface Polymorphism ===
Area: 78.5
Area: 25.0
*/
