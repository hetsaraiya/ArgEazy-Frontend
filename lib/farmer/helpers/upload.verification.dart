import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<Map<String, dynamic>> uploadVerificationDocs(String apiUrl, File aadharCard, File panCard, File saatBaarCopy, String accessToken) async {
  final uri = Uri.parse(apiUrl);

  final request = http.MultipartRequest('POST', uri)
    ..headers['Authorization'] = 'Bearer $accessToken'
    ..files.add(await http.MultipartFile.fromPath(
      'addhar_card',
      aadharCard.path,
      contentType: MediaType('application', 'octet-stream'),
    ))
    ..files.add(await http.MultipartFile.fromPath(
      'pan_card',
      panCard.path,
      contentType: MediaType('application', 'octet-stream'),
    ))
    ..files.add(await http.MultipartFile.fromPath(
      'saat_baar_copy',
      saatBaarCopy.path,
      contentType: MediaType('application', 'octet-stream'),
    ));

  try {
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return {'success': true, 'message': 'Documents uploaded successfully.'};
    } else {
      return {'success': false, 'error': responseBody};
    }
  } catch (e) {
    return {'success': false, 'error': e.toString()};
  }
}
