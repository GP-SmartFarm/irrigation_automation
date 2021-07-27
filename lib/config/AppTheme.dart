import 'package:flutter/material.dart';
import 'AppColors.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    primaryColorLight: Colors.green,
    accentColor: Colors.grey,
    primaryColor: primary,
    scaffoldBackgroundColor: Color(0xfff7f8fa),
    appBarTheme: AppBarTheme(
      color: primary,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    cardColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black54,
      surface: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.red, fontSize: 12),
      headline2: TextStyle(color: Colors.red, fontSize: 1),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.blue,
      ),
      headline5: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: primary,
      ),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: Colors.black,height: 1.1),//height for space between lines
      headline2: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.black,height: 1.1),//height for space between lines

      subtitle1: TextStyle(color: Colors.black, height: 1.5, fontSize: 12),
    ),
    textTheme: TextTheme(
      //  bodyText1: TextStyle(color: Colors.white54, height: 1.5, fontSize: 12),
      headline1: TextStyle(color: Colors.blue, fontWeight: FontWeight.w100),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColorLight: Colors.white,
    accentColor: Colors.grey,
    scaffoldBackgroundColor: Color(0xff131722),
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      color: surface,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white54,
      surface: surface,
    ),
    cardColor: surface,
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.red, fontSize: 12),
      headline3: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: primary,
      ),
    ),
    accentTextTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white54, height: 1.5, fontSize: 12),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        color: Colors.white70,
        fontSize: 14.0,
      ),
    ),
  );
}
