import 'package:flutter/material.dart';
import '../app_theme.dart';

class MobileNumberField extends StatefulWidget {
  final TextEditingController controller;

  const MobileNumberField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _MobileNumberFieldState createState() => _MobileNumberFieldState();
}

class _MobileNumberFieldState extends State<MobileNumberField> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          decoration: InputDecoration(
            labelText: 'Mobile Number',
            labelStyle: TextStyle(color: AppTheme.textColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.secondaryColor),
            ),
            errorText: _errorMessage,
            suffixIcon: Icon(Icons.phone, color: AppTheme.iconColor),
          ),
          style: TextStyle(color: AppTheme.textColor),
          onChanged: (value) {
            if (value.length < 10) {
              setState(() {
                _errorMessage = 'Please type 10 digit number';
              });
            } else {
              setState(() {
                _errorMessage = null;
              });
            }
          },
        ),
      ],
    );
  }
}
