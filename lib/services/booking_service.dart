import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portify/models/booking_model.dart';

class BookingService {
  //static const String _url = 'https://oveego.in/Restapi/bookings';

  // Method to fetch booking data from the API
  // Future<List<Booking>> fetchBookingHistory() async {
  //   final response = await http.get(Uri.parse(_url));

  //   if (response.statusCode == 200) {
  //     return parseBookings(response.body);
  //   } else {
  //     throw Exception('Failed to load booking history');
  //   }
  // }

  Future<List<Booking>> fetchBookings(String? userId) async {
    if (userId == null) {
      throw Exception('User ID is null');
    }

    final url = 'https://oveego.in/Restapi/bookings?userId=$userId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return parseBookings(response.body);
      //final List<dynamic> data = json.decode(response.body);
      //return data.map((json) => Booking.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }
}
