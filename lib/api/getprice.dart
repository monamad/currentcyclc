import 'dart:convert';
//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Getdata {
  Future<Map<String, dynamic>> get() async {
    String url =
        'https://openexchangerates.org/api/latest.json?app_id=8ad9878a6ea14d0eb16d556efe6f755e';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data['rates'];
    } else {
      throw Exception(response.statusCode);
    }
  }
}
