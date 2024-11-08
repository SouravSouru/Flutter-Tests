import 'package:http/http.dart' as http;

class UserRepository {
  fetchuserList() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );
  }
}
