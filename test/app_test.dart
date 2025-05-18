import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button_counter/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // ✅ Works in headless CI without device

  setUp(() async {}); // Optional global setup

  testWidgets('Test 1: Initial count is 0', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.pumpAndSettle();
    expect(find.text('Count: 0'), findsOneWidget);
  });

  testWidgets('Test 2: Increment once should show 1', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 1'), findsOneWidget);
  });

  testWidgets('Test 3: Increment then decrement should go back to 0', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 0'), findsOneWidget);
  });

  testWidgets('Test 4: Increment twice should show 2', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 2'), findsOneWidget);
  });

  testWidgets('Test 5: Increment twice, decrement once should show 1', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 1'), findsOneWidget);
  });

  testWidgets('Test 6: Reset should return to 0', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.tap(find.byKey(const Key('resetButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 0'), findsOneWidget);
  });

  testWidgets('Test 7: Decrement from 0 should show -1', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: -1'), findsOneWidget);
  });

  testWidgets('Test 8: Reset from negative value should return to 0', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.tap(find.byKey(const Key('resetButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 0'), findsOneWidget);
  });

  testWidgets('Test 9: Increment 5 times should show 5', (tester) async {
    await tester.pumpWidget(const CounterApp());
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
    }
    expect(find.text('Count: 5'), findsOneWidget);
  });

  testWidgets('Test 10: Reset from 5 should return to 0', (tester) async {
    await tester.pumpWidget(const CounterApp());
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.byKey(const Key('incrementButton')));
    }
    await tester.tap(find.byKey(const Key('resetButton')));
    await tester.pumpAndSettle();
    expect(find.text('Count: 0'), findsOneWidget);
  });
}