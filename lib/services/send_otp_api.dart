import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wingman_test/constants/api_constants.dart';
import 'package:wingman_test/model/send_otp/request_model.dart';
import 'package:wingman_test/model/send_otp/response_model.dart';

class LoginService {
  Future<OtpResponse> sendOtp({required MobileNumber number}) async {
    const url = "$baseUrl/sendotp.php";
    final uri = Uri.parse(url);

    final response = await http.post(uri,
        body: jsonEncode(number),
        headers: {'Content-Type': 'application/json'});

    final otpResponse = otpResponseFromJson(response.body);

    return otpResponse;
  }
}
