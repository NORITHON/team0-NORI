import 'package:flutter/material.dart';

class TodoTheme {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      // textTheme: textThemeDefault,
      primaryColor: colorScheme.primary,
      backgroundColor: Colors.white,
      dividerColor: colorScheme.tertiary,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(primary: Color(0xFFFFFFFF), onPrimary: Colors.black, secondary: Color.fromARGB(255, 30, 28, 104), onSecondary: Color(0xFFFFFFFF), error: Color(0xffb00020), onError: Colors.white, background: Color(0xFFFFFFFF), onBackground: Colors.black, surface: Color(0xFFFFFFFF), onSurface: Colors.black, tertiary: Color(0xff999999), shadow: Color(0xffCCCCCC), brightness: Brightness.light
      // static const TextTheme textThemeDefault = TextTheme(
      //   headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind')
      // headline1: TextStyle(fontSize: 16, fontFamily: 'Sunflower-Medium.ttf'),
      // headline2: TextStyle(fontSize: 15, fontFamily: 'Seoul'),
      // subtitle1: TextStyle(fontSize: 13, fontFamily: 'NotoSans'),
      // bodyText1: TextStyle(fontSize: 11, fontFamily: 'NotoSans'),
      // );
      );
}
