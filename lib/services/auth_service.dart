import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portify/models/user_model.dart';

class AuthService {
  final String apiUrl = "https://oveego.in/Restapi";

  Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          print('Login successful: $responseData');
          return User.fromJson(responseData);
        } catch (e) {
          print('Error parsing JSON: $e');
          return null;
        }
      } else {
        print('Server error: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Network error: $e');
      return null;
    }
  }
}
