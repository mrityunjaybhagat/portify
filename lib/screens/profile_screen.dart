import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portify/models/user_model.dart';
import 'package:portify/providers/auth_provider.dart';
import 'package:portify/widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the authenticated user from AuthProvider
    User? user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: AppDrawer(),
      body: user != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user.profilePicture),
                        // Assuming user.profilePicture is a valid URL
                      ),
                      SizedBox(height: 20),
                      Text('Username: ${user.username}'),
                      Text('Email: ${user.email}'),
                      Text('Mobile: ${user.mobile}'),
                      // Add more fields as needed
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Call logout method from AuthProvider
                      Provider.of<AuthProvider>(context, listen: false)
                          .logout();
                      // Navigate back to login screen or any other screen after logout
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text('Logout'),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                  'Loading user data...'), // Handle loading state if necessary
            ),
    );
  }
}
