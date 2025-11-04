import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String rate;
  const CardItem({super.key, required this.image, required this.name, required this.desc, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: 180),
            const SizedBox(height: 10),
            CustomText(text: name,weight: FontWeight.bold,),
            CustomText(text: desc),
            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                Icon(Icons.star, color: Colors.amber, size: 25),
                CustomText(text: rate,size: 16,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
