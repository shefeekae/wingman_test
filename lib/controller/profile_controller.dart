import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/model/profile_submit/request_model.dart';

import 'package:wingman_test/providers/auth_provider.dart';

import 'package:wingman_test/services/profile_submit_api.dart';

class ProfileController {
  ProfileSubmitService submitService = ProfileSubmitService();
  submitProfile(
      {required BuildContext context,
      required String name,
      required String email}) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final navigator = Navigator.of(context);
    final body = ProfileSubmitRequest(name: name, email: email);

    final data = await submitService.submitProfile(profile: body);

    if (data.status) {
      authProvider.setBool(true);

      navigator.pushReplacementNamed(
        '/home',
      );
    }
  }
}
