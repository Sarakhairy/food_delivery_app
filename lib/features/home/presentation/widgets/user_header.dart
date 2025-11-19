import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Row(
      
            children: [
         
              CustomText(
                text: "Hello,\nSarah Khairy",
                size: 16,
                weight: FontWeight.bold,
        
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primaryColor,
            child: Icon(CupertinoIcons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
