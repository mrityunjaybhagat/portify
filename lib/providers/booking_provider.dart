import 'package:flutter/material.dart';
import 'package:portify/models/booking_model.dart';
import 'package:portify/services/booking_service.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookings = [];
  bool _isLoading = false;

  List<Booking> get bookings => _bookings;
  bool get isLoading => _isLoading;

  Future<void> fetchBookings(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _bookings = await BookingService().fetchBookings(userId);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
