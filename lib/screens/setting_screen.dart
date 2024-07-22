import 'package:flutter/material.dart';
import 'package:portify/widgets/rounded_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:portify/models/user_model.dart';
import 'package:portify/providers/auth_provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the authenticated user from AuthProvider
    User? user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      // ),
      //drawer: AppDrawer(),
      body: user != null
          ? Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Document',
                  leadingIcon: Icons.file_open,
                  onTap: () {
                    Navigator.pushNamed(context, '/documents');
                  },
                ),
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Vehicle Details',
                  leadingIcon: Icons.car_rental,
                  onTap: () {
                    Navigator.pushNamed(context, '/vehicle');
                  },
                ),
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Driver Details',
                  leadingIcon: Icons.man_2,
                  onTap: () {
                    Navigator.pushNamed(context, '/driver');
                  },
                ),
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Bank Details',
                  leadingIcon: Icons.home,
                  onTap: () {
                    Navigator.pushNamed(context, '/bank-form');
                  },
                ),
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Change Password',
                  leadingIcon: Icons.lock,
                  onTap: () {
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                RoundedIconButton(
                  text: 'Logout',
                  leadingIcon: Icons.logout,
                  onTap: () {
                    // Call logout method from AuthProvider
                    Provider.of<AuthProvider>(context, listen: false).logout();
                    // Navigate back to login screen or any other screen after logout
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            )
          : const Center(
              child: Text(
                  'Loading user data...'), // Handle loading state if necessary
            ),
    );
  }
}
