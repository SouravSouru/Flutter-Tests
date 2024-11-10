import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_lab/models/user_model.dart';
import 'package:flutter_test_lab/pages/user_list_page.dart';

void main() {
  testWidgets(
    // Test description: Verifies that the `UsersList` widget displays a list of users
    // with each user's name as the title and their email as the subtitle in `ListTile` widgets.
    'Displays List of users with title as name and subtitle as email',
    (tester) async {
      // Create a sample list of users to simulate fetched data
      final users = [
        User(id: 1, name: 'Sourav', email: 'sourav@gmail.com'),
        User(id: 2, name: 'Sayanora', email: 'sayanora@gmail.com'),
      ];

      // Mock function to simulate fetching users asynchronously with a 1-second delay
      Future<List<User>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
          () => users,
        );
      }

      // Build the widget using `MaterialApp` and pass the mock data fetch function to `UsersList`
      await tester.pumpWidget(MaterialApp(
        home: UsersList(
          usersList: mockFetchUsers(),
        ),
      ));

      // Check that a CircularProgressIndicator is shown initially while data is being fetched
      final ctr = find.byType(CircularProgressIndicator);
      expect(ctr, findsOneWidget);

      // Wait for all asynchronous tasks to complete and the UI to settle
      await tester.pumpAndSettle();

      // Verify that the ListView is displayed after data has loaded
      final ctr1 = find.byType(ListView);
      expect(ctr1, findsOneWidget);

      // Check that the correct number of ListTile widgets are present, matching the number of users
      expect(find.byType(ListTile), findsNWidgets(users.length));

      // For each user, confirm that their name appears as the title and email as the subtitle in ListTile
      for (final user in users) {
        expect(find.text(user.name ?? ""),
            findsOneWidget); // Check for user's name in the widget tree
        expect(find.text(user.email ?? ""),
            findsOneWidget); // Check for user's email in the widget tree
      }
    },
  );
}
