import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  void showToast({required String msg, required bool isErrorMsg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      textColor: isErrorMsg == true ? Colors.red : Colors.green,
    );
  }
}
