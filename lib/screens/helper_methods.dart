import 'package:geolocator/geolocator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:portify/models/address.dart';
import 'package:portify/providers/place_provider.dart';
import 'package:portify/screens/request_helper.dart';
import 'package:provider/provider.dart';

class HelperMethods {
  static Future<String> findCordinatesAddress(
      Position position, context) async {
    final String apiKey = 'AIzaSyCknD14Z85iTrBrOnBEnjZ4HUimMsvbbeA';
    String placeAddress = '';

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      //this return address
      return placeAddress;
    }

    var url = Uri.https('maps.googleapis.com', '/maps/api/geocode/json', {
      'latlng': '${position.latitude},${position.longitude}',
      'key': apiKey,
    });

    var response = await RequestHelper.getRequest(url);
    if (response != 'failed') {
      placeAddress = response['results'][0]['formatted_address'];
      Address pickupAddress = new Address();
      pickupAddress.latitude = position.latitude;
      pickupAddress.longintude = position.longitude;
      pickupAddress.placeName = placeAddress;
      Provider.of<AppData>(context, listen: false)
          .updatePickupAddress(pickupAddress);
    } else {
      return placeAddress;
    }
    return placeAddress;
  }
}
