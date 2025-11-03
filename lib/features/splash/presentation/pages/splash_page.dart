import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primaryColor,body: Center(
      child: Image.asset('assets/images/logo.png'),
    ),);
  }
}
