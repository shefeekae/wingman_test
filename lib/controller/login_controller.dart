import 'package:flutter/material.dart';
import 'package:wingman_test/model/send_otp/request_model.dart';
import 'package:wingman_test/services/send_otp_api.dart';

class LoginController {
  LoginService login = LoginService();

  sendOtp({required String mobileNumber, required BuildContext context}) async {
    final body = MobileNumber(mobile: mobileNumber);
    final navigator = Navigator.of(context);
    final otpResponse = await login.sendOtp(number: body);

    if (otpResponse.status) {
      navigator.pushNamed(
        '/otp',
        arguments: {
          'requestId': otpResponse.requestId,
          'number': mobileNumber,
        },
      );
    }
  }
}
