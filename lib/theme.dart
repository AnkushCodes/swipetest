import 'package:flutter/material.dart';

class AppColor {
  static Color color = Color(0xffF0F0F0);
}

ThemeData themeData = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColor.color),
    scaffoldBackgroundColor: AppColor.color);
