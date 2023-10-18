import 'package:api_project_bloc/models/users_model.dart';
import 'package:http/http.dart ' as http;

class UsersRepo {
  Future<List<UserModel>> getUsers() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      return throw Exception('Failed to load users');
    }
  }
}
