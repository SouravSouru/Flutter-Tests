import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_lab/pages/counter_page.dart';

void main() {
  // Define a widget test
  testWidgets(
    'given counter is 0 when increment button is clicked then counter should be 1',
    (tester) async {
      // Build the CounterPage widget within a MaterialApp for testing
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterPage(title: "Counter App"),
        ),
      );

      // Verify the initial counter value is 0 by finding a widget displaying '0'
      final ctr = find.text('0');
      expect(ctr,
          findsOneWidget); // Assert that the widget displaying '0' is found

      // Find the FloatingActionButton, which is the increment button
      final incrementBtn = find.byType(FloatingActionButton);

      // Simulate a tap on the increment button
      await tester.tap(incrementBtn);

      // Rebuild the widget to reflect the updated state after tapping
      await tester.pump();

      // Verify that the counter has incremented to 1 by finding a widget displaying '1'
      final ctr1 = find.text('1');
      expect(ctr1,
          findsOneWidget); // Assert that the widget displaying '1' is found
    },
  );
}
