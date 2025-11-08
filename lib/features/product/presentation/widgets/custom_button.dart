import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
                  boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 15, offset: Offset(0, 0)),
          ],
      ),
      child: Row(
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
          const SizedBox(width: 16),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              backgroundColor: Color(0xff145a32),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
            onPressed: onPressed,
            child: CustomText(text: text, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }
}
