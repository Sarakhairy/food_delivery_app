import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CartItem extends StatelessWidget {
  final String image, text, desc;
  final void Function()? onAdd;
  final void Function()? onDelete;
  final void Function()? onRemove;
  final int number;
  const CartItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    this.onAdd,
    this.onDelete,
    this.onRemove, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 100),
                CustomText(text: text, weight: FontWeight.bold),
                CustomText(text: desc),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xff1b5e20),
                        foregroundColor: Colors.white,
                      ),

                      onPressed: onAdd,
                      child: Icon(Icons.add),
                    ),
                    const SizedBox(height: 20),
                    CustomText(text: number.toString(), weight: FontWeight.bold, size: 20),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff1f1f1),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: onDelete,
                      child: Icon(Icons.remove, color: Color(0xffd32f2f)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe53935),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),

                  onPressed: onRemove,
                  child: Text("Remove"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
