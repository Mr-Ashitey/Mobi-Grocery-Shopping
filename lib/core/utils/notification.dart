import 'package:flutter/material.dart';

extension ShowNotification on BuildContext {
  void showNotification({required String message}) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ));
  }
}
