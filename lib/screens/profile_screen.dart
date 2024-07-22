import 'package:flutter/material.dart';
import 'package:portify/screens/avatar_image.dart';
import 'package:portify/widgets/rounded_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:portify/models/user_model.dart';
import 'package:portify/providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
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
                AvatarImage(imageProvider: NetworkImage(user.profilePicture)),
                Text(
                  'Username: ${user.username}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Mobile: ${user.mobile}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Email: ${user.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                RoundedIconButton(
                  text: 'Privacy',
                  leadingIcon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, '/privacy');
                  },
                ),
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Help & Support',
                  leadingIcon: Icons.help,
                  onTap: () {
                    Navigator.pushNamed(context, '/help');
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
                const SizedBox(height: 10),
                RoundedIconButton(
                  text: 'Settings',
                  leadingIcon: Icons.settings,
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                const SizedBox(height: 10),
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
