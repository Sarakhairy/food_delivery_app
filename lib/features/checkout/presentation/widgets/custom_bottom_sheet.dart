import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/checkout/presentation/widgets/payment_button.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 0)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Total", size: 14, color: Colors.black54),
                CustomText(
                  text: "80.9\$",
                  size: 20,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
            PaymentButton(),
          ],
        ),
      ),
    );
  }
}
