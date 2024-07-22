import 'package:flutter/material.dart';
import 'package:portify/app_theme.dart';
import 'package:portify/models/booking_model.dart';

class BookingDetailScreen extends StatelessWidget {
  final Booking booking;

  BookingDetailScreen({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Detail',
            style: TextStyle(color: AppTheme.secondaryColor)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppTheme.textColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address 1: ${booking.address1}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Address 2: ${booking.address2}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Date & Time: ${booking.dateTime}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('ID: ${booking.id}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
