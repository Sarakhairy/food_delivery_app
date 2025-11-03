import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
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
    
  )
);
