import 'package:flutter/material.dart';
import 'package:portify/app_theme.dart';

class RoundedIconButton extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final VoidCallback onTap;
  final IconData suffixIcon;

  const RoundedIconButton({
    required this.text,
    required this.leadingIcon,
    required this.onTap,
    this.suffixIcon = Icons.arrow_forward_ios, // Default suffix icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Make it full width
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // Add margin for spacing
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Distribute the space
          children: [
            Row(
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Icon(
              suffixIcon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
