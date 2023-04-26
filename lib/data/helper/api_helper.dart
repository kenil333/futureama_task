import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  static final http.Client _client = http.Client();

  static Future<http.Response> getApi(String uri) async {
    log("=====> API LOG: GET REQUEST:\n$uri");
    final http.Response response = await _client.get(
      Uri.parse(uri),
    );
    log("=====> API LOG: GET RESPONSE:\n${response.body} :: ${response.statusCode}");
    return response;
  }
}
