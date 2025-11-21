import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart'
    show AppColors;
import 'package:food_delivery_app/shared/custom_text.dart';

class CartItem extends StatefulWidget {
  final String image, text, spicy;

  final void Function()? onRemove;

  const CartItem({
    super.key,
    required this.image,
    required this.text,
    required this.spicy,

    this.onRemove,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int num = 1;
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
                Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                    width: 100,
                    placeholder: (context, url) {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Center(child: Icon(Icons.error));
                    },
                  ),
                ),

                SizedBox(
                  width: 180,
                  child: CustomText(text: widget.text, size: 15,weight: FontWeight.bold,)),
                CustomText(text: "Spicy: ${widget.spicy}"),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                      ),

                      onPressed: () {
                        setState(() {
                          num++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                    const SizedBox(height: 20),
                    CustomText(text: "$num", weight: FontWeight.bold, size: 20),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Color(0xfff1f1f1),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: num <= 1
                          ? null
                          : () {
                              setState(() {
                                if (num > 1) {
                                  num--;
                                }
                              });
                            },
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

                  onPressed: widget.onRemove,
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
