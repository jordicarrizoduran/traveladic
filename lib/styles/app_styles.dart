import 'package:flutter/material.dart';

class AppStyles {
  static const Color principal = Color(0XFFd18b45);
  static const Color footerText = Color(0XFF333333);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blueColor = Color(0xFF0000EE);
  static const bigTitle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const subTitle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const bigText = TextStyle(fontSize: 20);
  static const smallText = TextStyle(fontSize: 12);

  static const bigSeparator = SizedBox(
    height: 50,
    width: 50,
  );
  static const separator = SizedBox(
    height: 24,
    width: 24,
  );
  static const smallSeparator = SizedBox(
    height: 14,
    width: 14,
  );
}

class CustomColorScheme {
  final Color primaryColor;

  CustomColorScheme({required this.primaryColor});

  ColorScheme generateColorScheme() {
    return ColorScheme(
      primary: primaryColor,
      secondary: primaryColor.withOpacity(0.5),
      surface: Colors.white,
      background: Colors.grey,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }
}
