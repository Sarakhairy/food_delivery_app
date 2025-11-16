import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final  TextInputType keyboardType;
  const ProfileTextField({super.key, required this.hintText, required this.controller,  this.keyboardType =TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      style: TextStyle(color: Colors.black),
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20,
      decoration: InputDecoration(
        labelText: hintText,
        filled: false,
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),

          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
