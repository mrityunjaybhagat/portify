import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressService {
  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(url as Uri);

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String data = jsonDecode(response.body);
        print('Data successful: $data');
        return jsonDecode(data);
        //return User.fromJson(responseData);
      } catch (e) {
        print('Error parsing JSON');
        return null;
      }
    } else {
      print('Error');
      return null;
    }
  }
}
