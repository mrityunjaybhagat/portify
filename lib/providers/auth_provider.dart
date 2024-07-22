import 'package:flutter/material.dart';
import 'package:portify/models/user_model.dart';
import 'package:portify/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  bool _isAuthenticated = false;
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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isAuthenticated', true);
        return _user;
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', false);
    print('User logged out');
    notifyListeners();
  }

  //FOr Chnage Notifier
  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (user != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
