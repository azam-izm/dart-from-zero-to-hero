/*
===========================================
 Topic: Futures and Async/Await in Dart
===========================================
Futures in Dart represent a value or error that will be available at some time in the future.

 This lecture demonstrates:
 • The difference between synchronous (blocking) and asynchronous (non-blocking) code.
 • How to use Futures, async/await, and Future chaining in Dart.
 • Various flow control patterns: sequential, parallel, and mixed execution.
 • Comparison between traditional then() chaining and async/await.
 • Practical patterns like API chains, timeouts, retries, and parallel requests.
 
 Best Practices include:
   1. Prefer async/await for readability.
   2. Use Future.wait() for parallel tasks.
   3. Always handle errors using try/catch or .catchError.
   4. Avoid mixing sync and async code.
   5. Use timeouts and retries for robust operations.

Author: Muhammad Azam
===========================================
*/

// Import required libraries
import 'dart:async'; // for Future, Timer, TimeoutException
import 'dart:math'; // for Random()

////////////////////////
// MAIN ENTRY POINT   //
////////////////////////

Future<void> main() async {
  print('===========================================');
  print(' Topic: Futures and Async/Await in Dart');
  print(' Author: Muhammad Azam');
  print('===========================================\n');

  // SECTION 1: Core Concepts
  print('--- Section 1: Core Concepts ---');
  syncDemo();
  asyncDemo();

  // SECTION 2: Async/Await Fundamentals & Working Futures
  print('\n--- Section 2: Async/Await Fundamentals & Working Futures ---');
  showResponsiveness();
  await demonstrateAsyncAwait();
  await demonstrateFutures();

  // SECTION 3: Flow Control Patterns
  print('\n--- Section 3: Flow Control Patterns ---');
  await sequentialExecution();
  await parallelExecution();
  await mixedExecution();

  // SECTION 4: Then() vs Async/Await Comparison
  print('\n--- Section 4: Then() vs Async/Await Comparison ---');
  await traditionalThenApproach();
  await modernAsyncAwaitApproach();
  await mixedApproach();

  // SECTION 5: Practical Patterns and Best Practices
  print('\n--- Section 5: Practical Patterns and Best Practices ---');
  await demonstrateApiChain();
  await demonstrateTimeouts();
  await demonstrateRetries();
  await demonstrateParallelRequests();

  // Best Practices Summary
  print('\n--- Best Practices Summary ---');
  print('1. Prefer async/await for clarity and sequential flow.');
  print('2. Use Future.wait() for independent parallel operations.');
  print('3. Always handle errors with try/catch or .catchError.');
  print('4. Avoid mixing synchronous and asynchronous code.');
  print('5. Implement timeouts and retries for robust network operations.');
}

//////////////////////////////
// SECTION 1: Core Concepts //
//////////////////////////////

// Synchronous (blocking) demonstration
void syncDemo() {
  print('1.1 Sync demonstration start');
  // Simulate a blocking operation (do not use such patterns in real apps as they freeze the UI/execution)
  for (var i = 0; i < 100000000; i++) {} // CPU-intensive task simulation
  print('1.1 Sync demonstration end');
}

// Asynchronous (non-blocking) demonstration
void asyncDemo() {
  print('\n1.2a Async demonstration start');
  // Schedule an asynchronous task after 2 seconds.
  Future.delayed(Duration(seconds: 2), () {
    print('1.2b Async task completed');
  });
  // This line executes immediately without waiting for the Future to complete.
  print('1.2c Main continues executing immediately');
}

///////////////////////////////////////////////////////////
// SECTION 2: Async/Await Fundamentals & Working Futures //
///////////////////////////////////////////////////////////

// Simulated network call to fetch user data
Future<void> fetchUserData() async {
  print('2.1a Start fetching user data');
  await Future.delayed(Duration(seconds: 2));
  print('2.1b Data received');
}

// Demonstrates sequential execution using async/await along with a parallel task.
Future<void> demonstrateAsyncAwait() async {
  print('2.1c Before fetch call');
  // Launch a parallel task using then() (non-blocking)
  Future.delayed(Duration(seconds: 1))
      .then((_) => print('2.1d Parallel task done'));
  await fetchUserData();
  print('2.1e After fetch call');
}

// Displays periodic UI updates to simulate responsiveness
void showResponsiveness() {
  Timer.periodic(Duration(milliseconds: 500), (timer) {
    print('2.1f UI update ${timer.tick}');
    if (timer.tick >= 5) timer.cancel();
  });
}

// Demonstrates various Future patterns including immediate values, delayed futures, chaining, and error handling.
Future<void> demonstrateFutures() async {
  print('\n2.2 Working with Futures');

  // Immediate value using Future.value (queues in the event loop)
  print('2.2a Sync value: Direct access');
  Future.value('2.2b Future.value result').then(print).catchError(print);
  print('2.2c This prints before the Future.value resolves');

  // Delayed Future using then() method
  Future.delayed(Duration(seconds: 1), () => '2.2d Delayed then()')
      .then(print)
      .catchError(print);

  // Delayed Future using async/await with error handling
  try {
    final result =
        await Future.delayed(Duration(seconds: 1), () => '2.2e Awaited result');
    print(result);
  } catch (e) {
    print('2.2f Error: $e');
  }

  // Error handling with Futures:
  Future.error('2.2g Simulated error')
      .then((_) => print('This won’t execute'))
      .catchError((e) => print(e));

  try {
    await Future.error('2.2h Thrown error');
  } catch (e) {
    print('2.2i Caught error: $e');
  }

  // Future chaining: perform arithmetic operations step-by-step.
  Future.delayed(Duration(milliseconds: 500), () => 10)
      .then((val) => val * 2)
      .then((val) => val + 5)
      .then((val) => print('2.2j Chained result: $val'));
}

//////////////////////////////////////////////
// SECTION 3: Flow Control Patterns         //
// Sequential, Parallel and Mixed Execution //
//////////////////////////////////////////////

// Sequential Execution: asynchronous tasks one after another.
Future<void> sequentialExecution() async {
  print('\n3.1 Sequential Execution');
  final startTime = DateTime.now();
  final user = await fetchUserProfile();
  final orders = await fetchUserOrders(user);
  print('3.1a Orders: $orders');
  print('3.1b Total time: ${DateTime.now().difference(startTime)}');
}

Future<String> fetchUserProfile() async {
  await Future.delayed(Duration(seconds: 1));
  print('3.1c Fetched user profile');
  return 'User123';
}

Future<List<String>> fetchUserOrders(String userId) async {
  await Future.delayed(Duration(seconds: 2));
  print('3.1d Fetched orders for $userId');
  return ['Order1', 'Order2'];
}

// Parallel Execution: running tasks concurrently using Future.wait.
Future<void> parallelExecution() async {
  print('\n3.2 Parallel Execution');

  Future<String> getProductDetails() async {
    await Future.delayed(Duration(seconds: 2));
    print('3.2a Got product details');
    return 'Product Info';
  }

  Future<double> getPriceData() async {
    await Future.delayed(Duration(seconds: 3));
    print('3.2b Got price data');
    return 99.99;
  }

  Future<int> getInventory() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('3.2c Inventory system offline');
  }

  final startTime = DateTime.now();
  try {
    final results = await Future.wait(
        [getProductDetails(), getPriceData(), getInventory()]);
    print('3.2d Results: $results');
  } catch (e) {
    print('3.2e Error occurred: $e');
  }
  print('3.2f Total time: ${DateTime.now().difference(startTime)}');
}

// Mixed Execution: combining sequential and parallel patterns.
Future<void> mixedExecution() async {
  print('\n3.3 Mixed Execution');
  final startTime = DateTime.now();
  final authToken = await loginUser();
  final userProfile = await getProfile(authToken);
  // Fetch notifications and messages in parallel.
  final results =
      await Future.wait([getNotifications(authToken), getMessages(authToken)]);
  print('''
3.3a User Profile: $userProfile
3.3b Notifications count: ${results[0].length}
3.3c Messages count: ${results[1].length}
3.3d Total time: ${DateTime.now().difference(startTime)}
  ''');
}

Future<String> loginUser() async {
  await Future.delayed(Duration(seconds: 1));
  return 'auth-token-123';
}

Future<String> getProfile(String token) async {
  await Future.delayed(Duration(seconds: 2));
  return 'User Profile Data';
}

Future<List<String>> getNotifications(String token) async {
  await Future.delayed(Duration(seconds: 3));
  return ['Alert1', 'Alert2'];
}

Future<List<String>> getMessages(String token) async {
  await Future.delayed(Duration(seconds: 2));
  return ['Message1', 'Message2'];
}

/////////////////////////////////////////////////////
// SECTION 4: Then() vs Async/Await Comparison
/////////////////////////////////////////////////////

Future<String> fetchUserDataRandom() async {
  if (Random().nextBool()) {
    await Future.delayed(Duration(seconds: 1));
    return 'User123';
  } else {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Network error');
  }
}

Future<String> processUserData(String user) async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'Processed-$user';
}

Future<void> traditionalThenApproach() async {
  print('\n4.1 Traditional then() chain');
  await Future.delayed(Duration(seconds: 1))
      .then((_) => fetchUserDataRandom())
      .then((user) => processUserData(user))
      .then((processed) => print('4.1a Processed data: $processed'))
      .catchError((e) => print('4.1b Chain error: $e'))
      .whenComplete(() => print('4.1c Chain completed'));
}

Future<void> modernAsyncAwaitApproach() async {
  print('\n4.2 Async/await approach');
  try {
    await Future.delayed(Duration(seconds: 1));
    final user = await fetchUserDataRandom();
    final processed = await processUserData(user);
    print('4.2a Processed data: $processed');
  } catch (e) {
    print('4.2b Caught error: $e');
  } finally {
    print('4.2c Async flow completed');
  }
}

Future<void> mixedApproach() async {
  print('\n4.3 Mixed approach');
  await fetchUserDataRandom().then((user) async {
    try {
      final processed = await processUserData(user);
      print('4.3a Processed: $processed');
    } catch (e) {
      print('4.3b Processing error: $e');
    }
  }).catchError((e) => print('4.3c Fetch error: $e'));
}

//////////////////////////////////////////////////////////
// SECTION 5: Practical Patterns and Best Practices
//////////////////////////////////////////////////////////

Future<String> fetchUser() async {
  await Future.delayed(Duration(seconds: 1));
  return 'User123';
}

Future<String> fetchOrders(String user) async {
  await Future.delayed(Duration(milliseconds: 500));
  return '3 orders for $user';
}

Future<List<String>> fetchNotifications(String user) async {
  await Future.delayed(Duration(seconds: 2));
  return ['Notification 1', 'Notification 2'];
}

Future<List<String>> fetchMessages(String user) async {
  await Future.delayed(Duration(seconds: 3));
  return ['Message 1', 'Message 2'];
}

Future<void> demonstrateApiChain() async {
  print('\n5.1 API Request Chain');
  try {
    final orders = await fetchUser().then(fetchOrders);
    print('5.1a Orders: $orders');
  } catch (e) {
    print('5.1b Error: $e');
  }
}

Future<void> demonstrateTimeouts() async {
  print('\n5.2 Timeout Handling');
  try {
    await Future.delayed(Duration(seconds: 5)).timeout(Duration(seconds: 2));
  } on TimeoutException {
    print('5.2a Task timed out!');
  } catch (e) {
    print('5.2b Other error: $e');
  }
}

Future<void> demonstrateRetries() async {
  print('\n5.3 Retry Pattern');
  int attempt = 0;
  // Retry until maximum attempts (3) are reached.
  while (attempt < 3) {
    try {
      attempt++;
      print('5.3a Attempt $attempt');
      // Simulate a failure that always occurs.
      await Future.delayed(Duration(seconds: 1))
          .then((_) => throw Exception('Temporary failure'));
      // If the operation succeeds (it won't in this simulation), exit early.
      print('5.3d Success on attempt $attempt');
      return;
    } catch (e) {
      print('5.3b Error: $e');
      if (attempt >= 3) {
        print('5.3c Max attempts reached, handling error gracefully.');
      }
    }
  }
}

Future<void> demonstrateParallelRequests() async {
  print('\n5.4 Parallel Requests');
  try {
    final results =
        await Future.wait([fetchNotifications('user'), fetchMessages('user')]);
    print('5.4a Notifications: ${results[0].length}');
    print('5.4b Messages: ${results[1].length}');
  } catch (e) {
    print('5.4c Error: $e');
  }
}
