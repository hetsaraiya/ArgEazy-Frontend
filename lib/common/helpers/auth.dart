import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool validateForm(GlobalKey<ShadFormState> formKey) {
  final currentState = formKey.currentState;
  if (currentState == null) {
    print('FormKey currentState is null.');
    return false;
  } else if (currentState.saveAndValidate()) {
    print('Validation succeeded with ${currentState.value}');
    return true;
  } else {
    print('Validation failed');
    return false;
  }
}

Future<void> login(
    BuildContext context, String username, String password) async {
  final url = Uri.parse('${dotenv.env["ENDPOINT"]}/login');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    // Store tokens and user type
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh_token', responseData['refresh']);
    await prefs.setString('access_token', responseData['access']);
    await prefs.setString('user_type', responseData['user_type']);

    final String userType = responseData['user_type'];
    final bool verified = responseData['verified'];
    final bool docsUploaded = responseData['docs_uploaded'];

    if (!verified) {
      Navigator.pushNamed(context, '/$userType/verification/pending');
    } else if (!docsUploaded) {
      Navigator.pushNamed(context, '/$userType/verification');
    } else {
      Navigator.pushNamed(context, '/$userType/home');
    }
  } else {
    // Handle error
    print('Login failed: ${response.body}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login failed: ${response.body}'),
      ),
    );
  }
}

Future<void> signup(BuildContext context, String username, String password,
    String email, String phone, String role) async {
  final url = Uri.parse('${dotenv.env["ENDPOINT"]}/signup');
  print("Pressed");
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password1': password,
      'password2': password,
      'email': email,
      'phone_number': phone,
      'user_type': role,
    }),
  );

  if (response.statusCode == 201) {
    // Parse the response data
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    // Extract tokens
    final String refreshToken = responseData['refresh'];
    final String accessToken = responseData['access'];

    // Store tokens in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh_token', refreshToken);
    await prefs.setString('access_token', accessToken);

    // Navigate to the verification page
    if (role == "consumer") {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/consumer/verification',
        (route) => false,
      );
    } else if (role == "farmer") {
      Navigator.pushNamedAndRemoveUntil(context, '/farmer/verification', (route) => false);
    }
  } else {
    // Handle error
    print('Signup failed: ${response.body}');
    // Show error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Signup failed: ${response.body}'),
      ),
    );
  }
}
