/*
Mastering Inheritance in Dart - Step by Step
============================================
This lecture demonstrates a logical progression of inheritance concepts:
1. Basic Inheritance
2. Overriding Methods
3. Using the 'super' Keyword
4. Multilevel Inheritance
5. Abstract Classes
6. Mixins
7. Interfaces with 'implements'
8. Constructor Inheritance

Definition: 
Inheritance is a mechanism in Dart where a subclass inherits properties and methods from a superclass, 
promoting code reusability and hierarchy. 

Purpose: 
It allows us to create new classes based on existing ones, reducing code duplication and improving 
maintainability.
*/

// -----------------------------
// 1. Basic Inheritance
// -----------------------------
class Vehicle {
  void start() {
    print("Vehicle is starting...");
  }
}

class Car extends Vehicle {
  void drive() {
    print("Car is driving...");
  }
}

// -----------------------------
// 2. Overriding Methods
// -----------------------------
class Animal {
  void makeSound() {
    print("Animal makes a sound."); // Base behavior
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks!"); // Overridden behavior
  }
}

// -----------------------------
// 3. Using the 'super' Keyword
// -----------------------------
class Bird {
  static String classification = "Aves"; // Static member

  void fly() {
    print("Bird is flying...");
  }
}

class Sparrow extends Bird {
  @override
  void fly() {
    super.fly(); // Valid: non-static member
    print("Sparrow is flying at a low altitude.");

    // Access static member CORRECTLY
    print("Scientific classification: ${Bird.classification}");

    // Invalid: Can't use super with static members
    // print(super.classification);
  }
}

// -----------------------------
// 4. Multilevel Inheritance
// -----------------------------
class LivingBeing {
  void breathe() {
    print("Breathing...");
  }
}

class Mammal extends LivingBeing {
  void walk() {
    print("Mammal is walking...");
  }
}

class Human extends Mammal {
  void think() {
    print("Human is thinking...");

    // Can access all ancestor methods through inheritance
    breathe(); // From LivingBeing (via Mammal)
    walk(); // From Mammal

    // Can't directly access grandparent's members using super
    // super.super.breathe(); // INVALID: No skip-level access
  }
}

// New: Home Automation System Example
class SmartDevice {
  void powerOn() {
    print("Device is powering on...");
  }
}

class Light extends SmartDevice {
  @override
  void powerOn() {
    super.powerOn(); // Calls SmartDevice's powerOn()
    print("Light is turning on with default brightness");
  }

  void dim() {
    print("Adjusting light brightness");
  }
}

class ColorLight extends Light {
  @override
  void powerOn() {
    super.powerOn(); // Calls Light's powerOn()
    print("Color light is activating RGB mode");

    // Direct grandparent access attempt (Won't work)
    // super.super.powerOn(); // INVALID!
  }

  void setColor(String color) {
    print("Setting light color to $color");
    dim(); // Can call parent's method through inheritance
  }
}

// -----------------------------
// 5. Abstract Classes
// -----------------------------
abstract class Shape {
  void draw(); // Abstract method: must be implemented by subclasses.
}

class Circle extends Shape {
  @override
  void draw() {
    print("Drawing a Circle");
  }
}

// -----------------------------
// 6. Mixins - Alternative to Multiple Inheritance
// -----------------------------
mixin CanRun {
  void run() {
    print("Running...");
  }
}

mixin CanJump {
  void jump() {
    print("Jumping...");
  }
}

class Athlete with CanRun, CanJump {}

// -----------------------------
// 7. Interfaces with 'implements'
// -----------------------------
abstract class CanSwim {
  void swim();
}

abstract class CanFly {
  void fly();
}

class Duck implements CanSwim, CanFly {
  @override
  void swim() {
    print("Duck is swimming.");
  }

  @override
  void fly() {
    print("Duck is flying.");
  }
}

/*
-----------------------------
8. Constructor Inheritance
-----------------------------

This section demonstrates:
1. Constructor inheritance in Dart
2. How to use `super` in constructors
3. Named constructors and their inheritance
4. Static member access in inheritance
5. Limitations of constructor inheritance
*/

class Person {
  // Fields with default values
  String name = "Unknown";
  int age = 0;

  // Default constructor
  Person() {
    print("Person created using default constructor");
  }

  // Named constructor without parameters
  Person.anonymous() {
    print("Person created using anonymous constructor");
  }

  // Named constructor with parameters
  Person.withDetails(this.name, this.age) {
    print("Person created with details: Name = $name, Age = $age");
  }
}

class Student extends Person {
  String grade = "Not Assigned";

  // Default constructor: here super() calls Person's default constructor
  Student() : super() {
    print("Student created using default constructor");
    print("Inherited Person properties: name = $name, age = $age");
  }

  // Named constructor without parameters: super.anonymous() calls Person.anonymous()
  Student.anonymous() : super.anonymous() {
    print("Student created using anonymous constructor");
    print("Inherited Person properties: name = $name, age = $age");
  }

  // Named constructor with parameters: super.withDetails(name, age) calls Person.withDetails()
  Student.withDetails(String name, int age, this.grade)
      : super.withDetails(name, age) {
    print("Student created with details: Grade = $grade");
    print("Inherited Person properties: name = $name, age = $age");
  }

  // Invalid example: Factory constructor cannot use `super`
  /*
  factory Student.create() {
    super(); // Not allowed
    return Student();
  }
  */
}

/*
Static Member Access in Inheritance

Key Points:
- Static members belong to the class, not instances
- Subclasses can access superclass static members using the superclass name
- `super` cannot be used to access static members
*/
class Superclass {
  static String staticValue = "Superclass static";
  String instanceValue = "Superclass instance";
}

class Subclass extends Superclass {
  void showValues() {
    // Accessing static member using superclass name
    print(Superclass.staticValue); // Correct static access

    // Accessing inherited instance member
    print(instanceValue); // Inherited instance value

    // Accessing instance member using `super`
    print(super.instanceValue); // Also valid instance access

    // Invalid: Cannot use `super` for static members
    // print(super.staticValue); // ERROR
  }
}

// -----------------------------
// Main function: Demonstrating all concepts
// -----------------------------
void main() {
  // 1. Basic Inheritance Demonstration
  print("=== Basic Inheritance Example ===");
  Car myCar = Car();
  myCar.start(); // Output: Vehicle is starting...
  myCar.drive(); // Output: Car is driving...
  print(""); // Blank line for readability

  // 2. Overriding Methods Demonstration
  print("=== Overriding Methods Example ===");
  Dog myDog = Dog();
  myDog.makeSound(); // Output: Dog barks!

  // 3. Using the 'super' Keyword Demonstration
  print("\n=== Using 'super' Keyword Example ===");
  Sparrow sparrow = Sparrow();
  sparrow.fly();
  // Expected Output:
  // Bird is flying...
  // Sparrow is flying at a low altitude.

  // 4. Multilevel Inheritance Demonstration
  print("\n=== Multilevel Inheritance Example ===");
  Human person = Human();
  person.think();
  /* Output:
     Human is thinking...
     Breathing...
     Mammal is walking...
  */

  print("\n=== Home Automation Demo ===");
  ColorLight livingRoomLight = ColorLight();
  livingRoomLight.powerOn();
  /* Output:
     Device is powering on... (via Light's super.powerOn())
     Light is turning on with default brightness
     Color light is activating RGB mode
  */

  print("\n=== Color Adjustment Demo ===");
  livingRoomLight.setColor("blue");
  /* Output:
     Setting light color to blue
     Adjusting light brightness
  */

  // 5. Abstract Classes Demonstration
  print("\n=== Abstract Classes Example ===");
  Circle myCircle = Circle();
  myCircle.draw(); // Output: Drawing a Circle

  // 6. Mixins Demonstration
  print("\n=== Mixins Example ===");
  Athlete athlete = Athlete();
  athlete.run(); // Output: Running...
  athlete.jump(); // Output: Jumping...

  // 7. Interfaces Demonstration
  print("\n=== Interfaces Example ===");
  Duck duck = Duck();
  duck.swim(); // Output: Duck is swimming.
  duck.fly(); // Output: Duck is flying.

  // 8. Constructor Inheritance Demonstration
  print("=== Constructor Inheritance Examples ===");

  // Default constructor
  print("\n1. Default Constructor:");
  Student student1 = Student();
  /* Output:
     Person created using default constructor
     Student created using default constructor
     Inherited Person properties: name = Unknown, age = 0
  */

  // Named constructor without parameters
  print("\n2. Anonymous Constructor:");
  Student student2 = Student.anonymous();
  /* Output:
     Person created using anonymous constructor
     Student created using anonymous constructor
     Inherited Person properties: name = Unknown, age = 0
  */

  // Named constructor with parameters
  print("\n3. Parameterized Constructor:");
  Student student3 = Student.withDetails("Ali", 20, "A");
  /* Output:
     Person created with details: Name = Ali, Age = 20
     Student created with details: Grade = A
     Inherited Person properties: name = Ali, age = 20
  */

  print("\n=== Static Member Access Examples ===");
  Subclass subclass = Subclass();
  subclass.showValues();
  /* Output:
     Superclass static
     Superclass instance
     Superclass instance
  */
}
