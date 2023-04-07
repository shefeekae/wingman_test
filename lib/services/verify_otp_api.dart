import 'dart:convert';

import 'package:wingman_test/constants/api_constants.dart';
import 'package:wingman_test/model/verify_otp/otp_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:wingman_test/model/verify_otp/otp_response_model.dart';

class OtpService {
  // verify OTP
  Future<OtpVerifyResponse> verifyOtp({required OtpRequest request}) async {
    const url = "$baseUrl/verifyotp.php";
    final uri = Uri.parse(url);

    final response = await http.post(uri,
        body: jsonEncode(request),
        headers: {'Content-Type': 'application/json'});

    final otpResponse = otpVerifyResponseFromJson(response.body);

    return otpResponse;
  }
}
