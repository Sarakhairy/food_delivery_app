import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFFFF8F5),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFFFFF8F5),
  ),
  inputDecorationTheme:  InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
    ),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    border:   OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
    ),
    fillColor: Colors.white,
    filled: true,
    
  ),
  splashFactory: InkRipple.splashFactory,
);
