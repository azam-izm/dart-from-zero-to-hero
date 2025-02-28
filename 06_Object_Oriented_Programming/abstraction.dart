/*
Abstraction in Dart – Comprehensive Lecture
=================================================

Definition: Abstraction is the process of hiding complex details and showing only the essential parts 
to the programmer.

Purpose: It simplifies complex systems by focusing on 'what' a method does rather than 'how' it works.
        
Key Concepts:
-------------
• Abstract Classes: 
  - Cannot be instantiated directly (no objects created)
  - Can contain both abstract (no implementation) and concrete (with implementation) methods
  - Serve as blueprints for subclasses

• Method Overriding:
  - Abstract methods MUST be implemented in concrete subclasses
  - Concrete methods CAN be optionally overridden
  - Use @override annotation to indicate intentional overriding

• Inheritance Types:
  1. extends → Partial inheritance (inherits implementation/concrete methods)
  2. implements → Full interface contract (no inherited implementation/concrete methods)

• Inheritance Rules:
  ┌─────────────────────┬───────────────────────────────┐
  │      Feature        │  extends        implements    │
  ├─────────────────────┼───────────────────────────────┤
  │ Inherits Methods    │ All            None           │
  │ Must Override       │ Abstract only  All methods    │
  │ super Keyword Access│ Yes            No             │
  └─────────────────────┴───────────────────────────────┘

Implementation Guide:
---------------------
1. 'extends' → Like using a template:
   - Keep all existing features
   - Only update the blank spaces (abstract methods)

2. 'implements' → Like tracing a drawing:
   - Redraw EVERYTHING yourself
   - Follow the exact outline (all methods)

3. Abstract classes → Like Russian dolls:
   - Can nest inside each other
   - Each layer adds more details
*/

// Layer 1: Base Notification Contract
abstract class NotificationService {
  // Abstract method (must be implemented by subclasses)
  void sendNotification(String message);

  // Concrete method (default implementation)
  void logNotification(String message) {
    print("Base log: $message");
  }
}

// Layer 2a: Email Implementation (extends)
// Concrete class using 'extends' (only abstract methods overridden)
class EmailNotification extends NotificationService {
  @override
  void sendNotification(String message) {
    print("Email sent: $message");
    logNotification(message); // Inherits and uses parent's logNotification
  }
}

// Layer 2b: Push Notification (implements)
// Class using 'implements' (must override ALL methods)
class PushNotification implements NotificationService {
  @override
  void sendNotification(String message) {
    print("Push sent: $message");
  }

  @override
  void logNotification(String message) {
    print("Push service log: $message [${DateTime.now()}]"); // Full custom implementation required
  }
}

// Layer 3: Advanced Notification Base
// This abstract class extends the basic notification contract with advanced features (e.g., scheduling).
abstract class AdvancedNotificationService extends NotificationService {
  // In abstract classes, overriding parent methods (abstract or concrete) is optional.
  @override
  void sendNotification(String message) {
    print("Advanced notification initiated");
    super.logNotification(message); // Partial implementation using super
  }

  @override
  void logNotification(String message) {
    super.logNotification(message); // Access parent implementation
    print("Advanced metrics: ${DateTime.now()}");
  }

  void scheduleNotification(); // New abstract method
}

// Layer 4: Specialized SMS Notification
class ScheduledSMS extends AdvancedNotificationService {
  @override
  void scheduleNotification() {
    print("SMS queued for delivery");
  }

  @override
  void sendNotification(String message) {
    // Custom implementation with base access
    print("SMS dispatched: $message");
    super.logNotification(message);
  }
}

// Usage Demonstration
void main() {
  // extends Example
  print("--- Email Notification ---");
  final email = EmailNotification();
  email.sendNotification("Welcome to Dart!");

  // implements Example
  print("\n--- Push Notification ---");
  final push = PushNotification();
  push.sendNotification("Update available");

  // Multi-layer Abstraction
  print("\n--- Scheduled SMS ---");
  final sms = ScheduledSMS();
  sms.sendNotification("Meeting reminder");
  sms.scheduleNotification();
}

/*
EXPECTED OUTPUT:
--- Email Notification ---
Email sent: Welcome to Dart!
Base log: Welcome to Dart!

--- Push Notification ---
Push sent: Update available
Push service log: Update available [2023-08-15 14:30:45.123]
 // Note: Timestamps are generated at runtime using DateTime.now() and will differ on execution.

--- Scheduled SMS ---
SMS dispatched: Meeting reminder
Base log: Meeting reminder
Advanced metrics: 2025-02-28 11:06:57.151159
SMS queued for delivery
*/