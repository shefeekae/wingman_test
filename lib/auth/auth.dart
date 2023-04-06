import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/providers/auth_provider.dart';
import 'package:wingman_test/view/home_screen.dart';
import 'package:wingman_test/view/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return StreamBuilder(
      stream: authProvider.tokenStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
