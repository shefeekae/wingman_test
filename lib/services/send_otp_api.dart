import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wingman_test/constants/api_constants.dart';
import 'package:wingman_test/model/send_otp/request_model.dart';
import 'package:wingman_test/model/send_otp/response_model.dart';

class LoginService {
  //send OTP

  Future<OtpResponse> sendOtp({required MobileNumber number}) async {
    const url = "$baseUrl/sendotp.php";
    final uri = Uri.parse(url);

    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    final response =
        await http.post(uri, body: jsonEncode(number), headers: headers);

    final otpResponse = otpResponseFromJson(response.body);

    return otpResponse;
  }
}
