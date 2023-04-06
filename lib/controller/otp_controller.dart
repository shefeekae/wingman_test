import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/model/verify_otp/otp_request_model.dart';
import 'package:wingman_test/model/verify_otp/otp_response_model.dart';
import 'package:wingman_test/providers/auth_provider.dart';
import 'package:wingman_test/services/verify_otp_api.dart';
import 'package:wingman_test/utils/utils.dart';

class OtpController {
  OtpService otpService = OtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<OtpVerifyResponse> verifyOtp(
      {required BuildContext context,
      required String otp,
      required String requestId}) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final request = OtpRequest(requestId: requestId, code: otp);
    final navigator = Navigator.of(context);
    showError(String message) {
      showSnackBar(context, message, Colors.red);
    }

    final data = await otpService.verifyOtp(request: request);

    if (data.status) {
      await authProvider.persistToken(data.jwt);
      if (data.profileExists) {
        navigator.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        navigator.pushNamedAndRemoveUntil('/userInfo', (route) => false);
      }
    } else {
      showError(data.response);
    }
    return data;
  }
}
