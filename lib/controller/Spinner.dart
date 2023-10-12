import 'package:flutter/material.dart';

class Spinner extends ChangeNotifier {
  bool showSpinner = false;

  void changeSpinner(bool spinnerStatus) {

    showSpinner = spinnerStatus;
    notifyListeners();
  }
}