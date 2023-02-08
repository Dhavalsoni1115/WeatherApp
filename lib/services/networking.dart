import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    try {
      String data;
      http.Response response;
      response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        data = response.body;
        // print(data);
        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
