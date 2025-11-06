import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset('assets/images/logo.png', width: 90),
            CustomText(
              text: "Hello, Sarah Khairy",
              size: 16,
              weight: FontWeight.w500,
              color: Colors.grey.shade500,
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
    );
  }
}
