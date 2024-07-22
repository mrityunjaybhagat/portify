import 'package:flutter/material.dart';
import 'package:portify/widgets/CustomTextField.dart';
import 'package:portify/widgets/rounded_icon_button.dart';
import 'package:portify/widgets/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:portify/providers/auth_provider.dart';
import 'package:portify/models/user_model.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _login(BuildContext context) async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);

      try {
        User? user = await authProvider.login(username, password);

        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Login failed. Please check your credentials. Logn Screen 25')),
          );
        }
      } catch (e) {
        print('Login error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login error. Please try again later.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
                controller: _usernameController, labelText: 'Username'),
            SizedBox(height: 20),
            CustomTextField(
                controller: _passwordController, labelText: 'Password'),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () => _login(context),
            //   child: Text('Login'),
            // ),
            // SubmitButton(text: 'Login', onPressed: () => _login(context)),
            RoundedIconButton(
                text: "Login",
                leadingIcon: Icons.logout_outlined,
                onTap: () => _login(context))
          ],
        ),
      ),
    );
  }
}
