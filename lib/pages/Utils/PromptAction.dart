import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Promptaction {
  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg, textColor: Colors.black, backgroundColor: Colors.grey);
  }

  static showSuccess(String msg) {
    Fluttertoast.showToast(
        msg: msg, textColor: Colors.black, backgroundColor: Colors.green);
  }

  static showError(String msg) {
    Fluttertoast.showToast(
        msg: msg, textColor: Colors.black, backgroundColor: Colors.red);
  }

  static showWarning(String msg) {
    Fluttertoast.showToast(
        msg: msg, textColor: Colors.black, backgroundColor: Colors.yellow);
  }
}
