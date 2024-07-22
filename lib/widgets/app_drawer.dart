import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portify/providers/auth_provider.dart';
import 'package:portify/models/user_model.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<AuthProvider>(context).user;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            accountName: Text(user?.username ?? 'Username'),
            accountEmail: Text(user?.email ?? 'Email'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user?.profilePicture ?? ''),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('P r o f i l e'),
            onTap: () {
              Navigator.pop(context, '/profile');
              // Navigate to profile page if necessary
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('H i s t o r y'),
            onTap: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy),
            title: Text('Cloud'),
            onTap: () => {Navigator.pushNamed(context, '/cloud')},
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('B a n k  D e t a i l s'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('R e g i s t e r'),
            onTap: () {
              Navigator.pop(context, '/profile');
              // Navigate to profile page if necessary
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('L o g o u t'),
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
