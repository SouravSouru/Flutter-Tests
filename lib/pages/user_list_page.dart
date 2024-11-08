import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const ListTile(
          title: Text("name"),
          subtitle: Text("name@gmail.com"),
        );
      }),
    );
  }
}
