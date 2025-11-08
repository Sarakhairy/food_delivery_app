import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CheckoutDialog extends StatelessWidget {
  const CheckoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff145a32),
              child: Icon(Icons.check, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 10),
            CustomText(
              text: "Success!",
              size: 20,
              color: AppColors.primaryColor,
              weight: FontWeight.w600,
            ),
            const SizedBox(height: 8),
            CustomText(text: "Your order has been placed."),
            const SizedBox(height: 12),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  backgroundColor: Color(0xff145a32),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomText(text: "Close", color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
