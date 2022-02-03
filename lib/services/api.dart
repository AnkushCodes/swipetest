import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/welcome_model.dart';

class Api {
  static Future<Welcome> getData() async {
    try {
      var url = Uri.parse(
          'https://randomuser.me/api/?inc=gender,name,nat,location,picture,email&results=20');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Welcome welcome = Welcome.fromJson(jsonDecode(response.body));
        return welcome;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
