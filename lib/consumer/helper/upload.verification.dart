import 'package:http/http.dart' as http;
import 'dart:io';

Future<Map<String, dynamic>> uploadFiles(
    File addharCard, File panCard, String token) async {
  var uri =
      Uri.parse('http://192.168.220.18:8000/api/v1/upload_verification_docs');

  var request = http.MultipartRequest('POST', uri);
  request.headers['Authorization'] = 'Bearer $token';
  request.files
      .add(await http.MultipartFile.fromPath('addhar_card', addharCard.path));
  request.files
      .add(await http.MultipartFile.fromPath('pan_card', panCard.path));

  var response = await request.send();

  if (response.statusCode == 201) {
    return {'success': true};
  } else {
    return {
      'success': false,
      'error': 'Failed with status: ${response.statusCode}'
    };
  }
}
