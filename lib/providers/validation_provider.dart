import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ValidationProvider extends ChangeNotifier {
  bool isPhoneNumberValid = true;
  bool isNameValid = true;
  bool isEmailValid = true;

  String phoneMessage = "";
  String emailMessage = "";
  String nameMessage = "";

  validatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneMessage = "Please enter your phone number";
      notifyListeners();
      isPhoneNumberValid = false;
      notifyListeners();
    } else if (!RegExp(
            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
        .hasMatch(value)) {
      phoneMessage = "Please enter a valid phone number";
      notifyListeners();
      isPhoneNumberValid = false;
      notifyListeners();
    } else {
      isPhoneNumberValid = true;
    }
  }

  validateEmail(String value) {
    if (!EmailValidator.validate(value)) {
      emailMessage = "Please enter a valid email";
      notifyListeners();
      isEmailValid = false;
      notifyListeners();
    } else {
      isEmailValid = true;
      notifyListeners();
    }
  }

  validateName(String name) {
    if (name.isEmpty) {
      nameMessage = "Please enter your name";
      isNameValid = false;
      notifyListeners();
    } else {
      isNameValid = true;
      notifyListeners();
    }
  }
}
