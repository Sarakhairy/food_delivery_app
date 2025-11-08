import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_theme.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/login_page.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/signup_page.dart';
import 'package:food_delivery_app/features/splash/presentation/pages/splash_page.dart';
import 'package:food_delivery_app/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery app',
      theme: themeData,
      home:  SplashPage()
    );
  }
}

