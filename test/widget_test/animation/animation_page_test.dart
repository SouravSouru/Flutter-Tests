import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_lab/pages/animation_page.dart';

void main() {
  // Define a widget test for the AnimationScreen
  testWidgets('Animation screen test', (tester) async {
    
    // Load the AnimationScreen widget within a MaterialApp context
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimationScreen(),
      ),
    );

    // Find the Container widget in the AnimationScreen
    var containerFinder = find.byType(Container);
    // Verify that there is exactly one Container widget in the widget tree
    expect(containerFinder, findsOneWidget);
    // Retrieve the Container widget to check its initial properties
    var container = tester.widget<Container>(containerFinder);

    // INITIAL STATE CHECKS
    // Verify the initial width and height of the Container's constraints
    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    // Check the initial color of the Container's decoration
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    // Check the initial border radius of the Container (should be zero)
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.zero,
    );

    // Allow animations to complete by calling pumpAndSettle
    await tester.pumpAndSettle();

    // Retrieve the Container widget again to check its final properties
    containerFinder = find.byType(Container);
    container = tester.widget<Container>(containerFinder);

    // FINAL STATE CHECKS
    // Verify the updated width and height of the Container's constraints
    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    // Check the updated color of the Container's decoration
    expect((container.decoration as BoxDecoration).color, Colors.green);
    // Check the updated border radius of the Container (should be 50)
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.circular(50),
    );
  });
}
