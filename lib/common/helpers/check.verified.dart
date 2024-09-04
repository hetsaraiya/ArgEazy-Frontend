import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkVerified(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('access_token') ?? '';
  final url = Uri.parse('${dotenv.env["ENDPOINT"]}/check-verified');

  var response = await http.post(
    // Add await here
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accessToken',
    },
  );

  if (accessToken.isNotEmpty) {
    print("Done");
  } else {
    Navigator.pushReplacementNamed(context, '/login');
  }

  if (response.statusCode == 200) {
    // Now you can access statusCode
    print("Object");
  } else {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
