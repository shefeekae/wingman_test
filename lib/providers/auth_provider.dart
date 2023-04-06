import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  // String _token;

  bool profileExists = true;

  setBool(bool value) {
    profileExists = value;
    notifyListeners();
  }

  // String? get token => _token;

  Stream<bool> get profileExistStream => profileExists as Stream<bool>;

  Stream<String?> get tokenStream => _storage.read(key: 'token').asStream();

  Future<void> persistToken(String token) async {
    // _token = token;
    await _storage.write(key: 'token', value: token);
    notifyListeners();
  }

  Future<void> deleteToken() async {
    // _token = null;
    await _storage.delete(key: 'token');

    notifyListeners();
  }
}
