import 'package:contact_app/utils/app_color.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
  ),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,foregroundColor: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(foregroundColor:WidgetStateProperty.all(primary) ,
        backgroundColor:WidgetStateProperty.all (Colors.white)),
  ),
  textTheme: const TextTheme(titleLarge: TextStyle()),
);


ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,foregroundColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(foregroundColor:WidgetStateProperty.all(primary) ,
          backgroundColor:WidgetStateProperty.all (Colors.white)),
    ),
  textTheme: const TextTheme(titleLarge: TextStyle()),
);
