import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wingman_test/constants/api_constants.dart';
import 'package:wingman_test/model/profile_submit/request_model.dart';
import 'package:wingman_test/model/profile_submit/response_model.dart';

class ProfileSubmitService {
  Future<ProfileSubmitResponse> submitProfile(
      {required ProfileSubmitRequest profile}) async {
    const url = "$baseUrl/profilesubmit.php";
    final uri = Uri.parse(url);
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final response = await http.post(uri,
        body: jsonEncode(profile),
        headers: {'Content-Type': 'application/json', 'Token': token!});

    final submitResponse = profileSubmitResponseFromJson(response.body);

    // print(submitResponse.response);

    return submitResponse;
  }
}
