import 'package:flutter/material.dart';
import 'package:portify/screens/register/vehicledetais.dart';
import 'package:portify/widgets/CustomTextField.dart';
import 'package:portify/widgets/submit_button.dart';
import '../../app_theme.dart';

class BankDetailsForm extends StatefulWidget {
  const BankDetailsForm({super.key});

  @override
  State<BankDetailsForm> createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<BankDetailsForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _acnoController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Details',
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
                  controller: _nameController, labelText: "A/C Holder Name"),
              CustomTextField(
                  controller: _acnoController, labelText: "A/C Number"),
              CustomTextField(controller: _ifscController, labelText: "IFSC"),
              CustomTextField(
                  controller: _bankNameController, labelText: "Bank Name"),
              CustomTextField(
                  controller: _branchNameController, labelText: "Branch Name"),
              SubmitButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicleDetailsForm()),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
