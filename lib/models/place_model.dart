// models/place_model.dart

class Place {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Place({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['formatted_address'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
    );
  }
}
