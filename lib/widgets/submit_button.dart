import 'package:flutter/material.dart';
import '../app_theme.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SubmitButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primaryColor,
        onPrimary: AppTheme.secondaryColor,
      ),
      child: Text(text),
    );
  }
}
