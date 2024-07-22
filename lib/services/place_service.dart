// services/place_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceService {
  final String apiKey = 'AIzaSyCknD14Z85iTrBrOnBEnjZ4HUimMsvbbeA';

  Future<List<dynamic>> searchPlaces(String query) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['results'];
      return data;
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<String> findCoordinatesAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'][0]['formatted_address'];
    } else {
      throw Exception('Failed to load address');
    }
  }

  static void getCoordinatesFromAddress(String text, bool bool) {}
}
