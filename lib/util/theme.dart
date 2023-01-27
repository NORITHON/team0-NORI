import 'package:flutter/material.dart';

class NoriTheme {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textThemeDefault,
      primaryColor: colorScheme.primary,
      backgroundColor: Colors.white,
      dividerColor: colorScheme.tertiary,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFFFFFFF),
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(255, 217, 17, 1),
    onSecondary: Color.fromRGBO(255, 186, 53, 1),
    error: Color(0xffb00020),
    onError: Colors.white,
    background: Color.fromRGBO(0, 0, 0, 0.5),
    onBackground: Colors.black,
    surface: Color(0xFFFFFFFF),
    onSurface: Colors.black,
    tertiary: Color(0xff999999),
    shadow: Color(0xffCCCCCC),
    brightness: Brightness.light,
  );

  static const TextTheme textThemeDefault = TextTheme(
    headline1: TextStyle(fontSize: 30, fontFamily: 'Black'),
    headline2: TextStyle(fontSize: 23, fontFamily: 'Bold'),
    headline3: TextStyle(fontSize: 18, fontFamily: 'Bold'),
    bodyText1: TextStyle(fontSize: 13, fontFamily: 'Regular'),
    bodyText2: TextStyle(fontSize: 11, fontFamily: 'Light'),
  );
}
