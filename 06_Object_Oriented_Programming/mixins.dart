/*
=======================
 Topic: Mixins in Dart
=======================
Definition: A mixin is a code-sharing mechanism in Dart that allows you to reuse behavior 
(methods/properties) across multiple classes without inheritance. It’s an alternative to 
multiple inheritance, which Dart doesn’t support.

- Key Points:
  ✅ Defined with the `mixin` keyword.
  ✅ A class can use multiple mixins via `with`.
  ✅ Mixins cannot be instantiated or have constructors.
  ✅ They can contain methods, properties, and even abstract members.
  ✅ Mixins are not classes but can depend on specific class hierarchies using `on`.
  ✅ Order matters: Later mixins override overlapping methods from earlier ones.
===========================================
*/

// 1️⃣ Basic Mixins with State & Behavior
mixin Walkable {
  int legs = 2; // Default property value
  void walk() => print("Walking with $legs legs");
}

mixin Flyable {
  void fly() => print("Flying at 100 mph");
}

// 2️⃣ Inheritance + Mixins Combination
class Animal {
  void breathe() => print("Breathing...");
}

class Human extends Animal with Walkable {}

class Bird extends Animal with Walkable, Flyable {}

// 3️⃣ Mixin Constraints (on keyword)
// This mixin can only be used on classes extending Animal
mixin Swimmable on Animal {  // Restricted to Animal subclasses (Only for Animal subclasses)
  void swim() => print("Gliding through water");
}

class Fish extends Animal with Swimmable {}
// class Boat with Swimmable {}  // ❌ Compile error

// 4️⃣ Property Overriding Demonstration
class Dog extends Animal with Walkable {
  Dog() {
    legs = 4; // Override mixin's default value
  }
}

// 5️⃣ Method Overriding (Mixin Order Matters)
mixin Jumpable {
  void jump() => print("Basic jump: 1m height");
}

mixin HighJumpable {
  void jump() => print("Olympic jump: 2.5m height!");
}

class Athlete with Jumpable, HighJumpable {} // Last mixin HighJumpable.jump() takes precedence

// 6️⃣ Abstract Members in Mixins
mixin Nameable {
  String get name; // Abstract property
  void introduce() => print("Greetings! I'm $name");
}

class Person with Nameable {
  @override
  String get name => "Azam";
}

void main() {
  // 1-2. Basic Examples
  final human = Human();
  human.breathe(); // → Breathing...
  human.walk(); // → Walking with 2 legs

  final bird = Bird();
  bird.fly(); // → Flying at 100 mph
  bird.walk(); // → Walking with 2 legs

  // 3. Constrained Mixin
  final fish = Fish();
  fish.swim(); // → Gliding through water

  // 4. Property Overriding
  final dog = Dog();
  dog.walk(); // → Walking with 4 legs

  // 5. Method Resolution
  final athlete = Athlete();
  athlete.jump(); // → Olympic jump: 2.5m height!

  // 6. Abstract Members
  final person = Person();
  person.introduce(); // → Greetings! I'm Azam
}
