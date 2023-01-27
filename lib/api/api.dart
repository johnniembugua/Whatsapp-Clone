import 'dart:convert';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();
  static Future<Result<bool, String>> registerUser(
    String whatsapppin,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.registerAPI);
    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "whatsapppin": whatsapppin,
          },
        ),
      );
      if (response.statusCode == 200) {
        //print(response.body);
        return const Success(true);
      } else {
        //print(response.body);
        return Error(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      //print(e);
      return Error(e.toString());
    }
  }
}
