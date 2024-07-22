import 'package:flutter/material.dart';
import 'package:portify/screens/register/driverdetails.dart';
import 'package:portify/widgets/CustomTextField.dart';
import 'package:portify/widgets/submit_button.dart';
import '../../app_theme.dart';

class VehicleDetailsForm extends StatefulWidget {
  const VehicleDetailsForm({super.key});

  @override
  State<VehicleDetailsForm> createState() => _VehicleDetailsFormState();
}

class _VehicleDetailsFormState extends State<VehicleDetailsForm> {
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _licanceController = TextEditingController();
  final TextEditingController _lvalidController = TextEditingController();
  final TextEditingController _incvalidController = TextEditingController();
  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Details',
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
              Text(
                _selectedDate == null
                    ? 'No date selected!'
                    : 'Selected Date: ${_selectedDate!.toLocal()}'
                        .split(' ')[0],
              ),
              CustomTextField(
                  controller: _incvalidController,
                  labelText: 'INsurance Valid Date'),
              SubmitButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DriverDetailsForm()),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
