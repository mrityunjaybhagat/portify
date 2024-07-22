import 'package:flutter/material.dart';
import 'package:portify/app_theme.dart'; // Assuming you have a custom AppTheme defined

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: AppTheme.secondaryColor),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppTheme.textColor),
      leading: IconButton(
        icon: Icon(
          Icons.menu_rounded,
          size: 30,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
