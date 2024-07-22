import 'package:flutter/material.dart';
import 'package:portify/widgets/CustomTextField.dart';
import 'package:portify/widgets/rounded_icon_button.dart';
import 'package:portify/widgets/submit_button.dart';
import '../../app_theme.dart';

class DriverDetailsForm extends StatefulWidget {
  const DriverDetailsForm({super.key});

  @override
  State<DriverDetailsForm> createState() => _DriverDetailsFormState();
}

class _DriverDetailsFormState extends State<DriverDetailsForm> {
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _licanceController = TextEditingController();
  final TextEditingController _lvalidController = TextEditingController();
  final TextEditingController _incuvalidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Details',
            style: TextStyle(color: AppTheme.textColor)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppTheme.textColor),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                  controller: _regnoController, labelText: 'Registration No'),
              CustomTextField(
                  controller: _licanceController, labelText: 'Licance No'),
              CustomTextField(
                  controller: _lvalidController,
                  labelText: 'Licance Valid Date'),
              CustomTextField(
                  controller: _incuvalidController,
                  labelText: 'Insurance Expiring Date'),
              //SubmitButton(text: 'Next', onPressed: () {})
              RoundedIconButton(
                  text: 'Update', leadingIcon: Icons.save, onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
