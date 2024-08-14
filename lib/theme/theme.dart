import 'package:flutter/material.dart';

class Constants {
  // Colors from colors.dart
  static const Color mainGreen = Color(0xff5DE898);
  static const Color black = Color(0xff111111);
  static const Color blue = Color(0xff162D4F);
  static const Color success = Color(0xff20C462);
  static const Color link = Color(0xff409CFF);
  static const Color error = Color(0xffF84E29);
  static const Color warning = Color(0xffFFB340);
  static const Color fill = Color(0xffF5F5F7);
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xff717171);
  static const Color lightGreen = Color(0xffECF9F1);

  // Original colors from theme.dart
  static const Color lightPrimaryColor = Color.fromRGBO(255, 99, 71, 1); // Tomato
  static const Color lightSecondaryColor = Color.fromRGBO(255, 165, 0, 1); // Orange
  static const Color lightTextColor = Color.fromRGBO(33, 33, 33, 1); // Darker grey
  static const Color lightBg = Color.fromRGBO(255, 255, 255, 1); // White

  static const Color darkPrimaryColor = Color.fromRGBO(255, 69, 0, 1); // Red-Orange
  static const Color darkSecondaryColor = Color.fromRGBO(0, 191, 255, 1); // Deep Sky Blue
  static const Color darkTextColor = Color.fromRGBO(245, 245, 245, 1); // Light grey
  static const Color darkBg = Color.fromRGBO(18, 18, 18, 1); // Near Black

  static const Color darkAppBar = Color.fromRGBO(18, 18, 18, 0.8);
  static const Color lightAppBar = Color.fromRGBO(255, 255, 255, 0.8);

  // Uncomment the next line if you plan to use Google Fonts.
  // static final String? allFontFamily = GoogleFonts.poppins().fontFamily;
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Constants.lightPrimaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Constants.lightAppBar,
    foregroundColor: Constants.lightTextColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Constants.lightSecondaryColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Constants.lightPrimaryColor,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Constants.lightBg,
    labelStyle: TextStyle(color: Constants.lightTextColor),
  ),
  scaffoldBackgroundColor: Constants.lightBg,
  colorScheme: const ColorScheme.light(
    background: Constants.lightBg,
    primary: Constants.lightPrimaryColor,
    secondary: Constants.lightSecondaryColor,
  ),
  // Uncomment the next line if you plan to use Google Fonts.
  // fontFamily: Constants.allFontFamily,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Constants.darkPrimaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Constants.darkAppBar,
    foregroundColor: Constants.darkTextColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Constants.darkSecondaryColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Constants.darkPrimaryColor,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Constants.darkBg,
    labelStyle: TextStyle(color: Constants.darkTextColor),
  ),
  scaffoldBackgroundColor: Constants.darkBg,
  colorScheme: const ColorScheme.dark(
    background: Constants.darkBg,
    primary: Constants.darkPrimaryColor,
    secondary: Constants.darkSecondaryColor,
  ),
  // Uncomment the next line if you plan to use Google Fonts.
  // fontFamily: Constants.allFontFamily,
);
