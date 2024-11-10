import 'dart:convert';

import 'package:flutter_test_lab/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> fetchuserList() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      return jsonList.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception("Something Went Wrong");
    }
  }
}
