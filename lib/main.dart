import 'package:flutter/material.dart';
import 'package:flutter_test_lab/pages/counter_page.dart';
import 'package:flutter_test_lab/pages/user_list_page.dart';
import 'package:flutter_test_lab/repositorys/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UsersList(
        usersList: UserRepository().fetchuserList(),
      ),
    );
  }
}
