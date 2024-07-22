import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portify/widgets/CustomTextField.dart';
import 'package:portify/widgets/custom_app_bar.dart';
import 'package:portify/widgets/rounded_icon_button.dart';

class BankFormScreen extends StatefulWidget {
  @override
  _BankFormScreenState createState() => _BankFormScreenState();
}

class _BankFormScreenState extends State<BankFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse('https://oveego.in/Restapi/insertbank'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'bank_name': _bankNameController.text,
          'account_no': _accountNoController.text,
          'ifsc_code': _ifscCodeController.text,
          'branch_name': _branchNameController.text,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bank details submitted successfully!')),
        );
        _formKey.currentState!.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Failed to submit bank details. Responce code is not 200')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bank Details'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                  controller: _bankNameController, labelText: "labelText"),
              TextFormField(
                controller: _bankNameController,
                decoration: InputDecoration(labelText: 'Bank Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bank name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _accountNoController,
                decoration: InputDecoration(labelText: 'Account Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter account number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ifscCodeController,
                decoration: InputDecoration(labelText: 'IFSC Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter IFSC code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _branchNameController,
                decoration: InputDecoration(labelText: 'Branch Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter branch name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  // : ElevatedButton(
                  //     onPressed: _submitForm,
                  //     child: Text('Submit'),
                  //   ),
                  : RoundedIconButton(
                      text: 'Update',
                      leadingIcon: Icons.abc,
                      onTap: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
