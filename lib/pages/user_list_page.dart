import 'package:flutter/material.dart';
import 'package:flutter_test_lab/models/user_model.dart';

class UsersList extends StatelessWidget {
  final Future<List<User>> usersList;
  const UsersList({super.key, required this.usersList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: FutureBuilder(
          future: usersList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final user = snapshot.data?[index];
                    return ListTile(
                      title: Text(user?.name ?? ""),
                      subtitle: Text(user?.email ?? ""),
                    );
                  });
            }

            return const Center(
              child: Text("Something went wrong"),
            );
          }),
    );
  }
}
