import 'package:flutter/material.dart';
import 'package:portify/models/user_model.dart';
import 'package:portify/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  final AuthService _authService = AuthService();

  Future<User?> login(String username, String password) async {
    _setLoading(true);

    try {
      _user = await _authService.login(username, password);
      if (_user == null) {
        print('Login failed  Auth Provider 20: Invalid username or password');
        return null;
      } else {
        print('Login successful Auth Provider 22: $_user');
        return _user;
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  void logout() {
    _user = null;
    print('User logged out');
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
