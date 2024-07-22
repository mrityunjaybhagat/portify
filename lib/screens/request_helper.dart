import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<dynamic> getRequest(Uri url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Data successful: $responseData');
        return responseData;
        //String data = jsonDecode(response.body);
        //print('Data successful: $data');
        //var decodeData = jsonDecode(data);
        //return jsonDecode(decodeData);
      } catch (e) {
        print('Failed');
        return 'failed';
      }
    } else {
      print('Failed');
      return 'failed';
    }
  }

  static Future<List<dynamic>> searchPlace(
      String placeName, String apiKey) async {
    if (placeName.length > 1) {
      var url = Uri.https(
          'maps.googleapis.com', '/maps/api/place/autocomplete/json', {
        'input': placeName,
        'key': apiKey,
        'components': 'country:in',
      });

      var response = await getRequest(url);
      if (response != 'Failed' && response['status'] == 'OK') {
        return response['predictions'];
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
