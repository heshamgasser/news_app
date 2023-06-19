import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: lightPrimaryColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: lightBackgroundColor,
        onPrimary: lightPrimaryColor,
        secondary: Colors.white,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.white54,
        surface: Colors.black,
        onSurface: Colors.white),
    appBarTheme: const AppBarTheme(
      color: lightPrimaryColor,

      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      titleSpacing: 20,
    ),
    textTheme: TextTheme(
        titleLarge: lightTitleTextLarge,
        titleMedium: lightTitleTextMedium,
        titleSmall: lightTitleTextSmall,
        bodyLarge: lightBodyTextLarge,
        bodyMedium: lightBodyTextMedium,
        bodySmall: lightBodyTextSmall),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: darkPrimaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: darkPrimaryColor,
      onPrimary: darkPrimaryColor,
      secondary: darkPrimaryColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Color(0xFF141922),
    ),
    appBarTheme: const AppBarTheme(
      color: darkPrimaryColor,

      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      titleSpacing: 20,
    ),
    textTheme: TextTheme(
        titleLarge: darkTitleTextLarge,
        titleMedium: darkTitleTextMedium,
        titleSmall: darkTitleTextSmall,
        bodyLarge: darkBodyTextLarge,
        bodyMedium: darkBodyTextMedium,
        bodySmall: darkBodyTextSmall),
  );
}
