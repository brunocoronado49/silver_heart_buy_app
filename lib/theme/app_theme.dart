import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Colors.white;
  static const secondaryColor = Colors.grey;
  static const thirdColor = Colors.black;
  static const elevation = 0;
  static const backgroundColor = Color(0xffff5f6fa);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: thirdColor
      ),
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: thirdColor,
        fontSize: 20,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Quicksand',
  );
}