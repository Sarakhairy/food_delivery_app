import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/checkout/presentation/widgets/checkout_dialog.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(150, 50),
        backgroundColor: Color(0xff145a32),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return CheckoutDialog();
          },
        );
      },
      child: CustomText(text: "Pay Now", color: Colors.white, size: 16),
    );
    
  }
}
