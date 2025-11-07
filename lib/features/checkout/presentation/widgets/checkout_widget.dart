import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CheckoutWidget extends StatelessWidget {
  final String title;
  final String price;
  final bool isSmall;
  final bool isBold;
  const CheckoutWidget({
    super.key,
    required this.title,
    required this.price,
    this.isSmall = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          size: isSmall? 12: 15,
          weight: isBold ? FontWeight.bold : FontWeight.w400,
          color: Colors.grey.shade600,
        ),
        CustomText(
          text: price,
          size: isSmall? 12:15,
          weight: isBold ? FontWeight.bold : FontWeight.w400,
          color: Colors.grey.shade600,
        ),
      ],
    );
  }
}
