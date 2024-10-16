import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color dark = Color(0xff242424);
  static const Color gold = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      // foregroundColor: Colors.amber,
      // iconTheme: IconThemeData(color: Colors.blue),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightPrimary,
      selectedItemColor: Colors.black,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
  );
}
