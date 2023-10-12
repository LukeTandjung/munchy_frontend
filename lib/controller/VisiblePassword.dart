import 'package:flutter/material.dart';

class VisiblePassword extends ChangeNotifier {
  bool hidePassword = true;

  void showPassword() {

    hidePassword = !hidePassword;
    notifyListeners();
  }
}