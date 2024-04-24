import 'package:flutter/material.dart';

class THelper {
  static void navigateToScreen (BuildContext context,Widget screen) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (_) => screen));
  }

  static bool isDarkMode (BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}