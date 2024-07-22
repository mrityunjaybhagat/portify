import 'dart:convert';

class Booking {
  final String address1;
  final String address2;
  final String dateTime;
  final int id;

  Booking({
    required this.address1,
    required this.address2,
    required this.dateTime,
    required this.id,
  });

  // Factory method to create a Booking instance from JSON data
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      address1: json['address1'],
      address2: json['address2'],
      dateTime: json['dateTime'],
      id: int.parse(json['id'].toString()),
    );
  }

  // Method to convert a Booking instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'address1': address1,
      'address2': address2,
      'dateTime': dateTime,
      'id': id,
    };
  }
}

// Function to parse the JSON response and return a list of Booking instances
List<Booking> parseBookings(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Booking>((json) => Booking.fromJson(json)).toList();
}
