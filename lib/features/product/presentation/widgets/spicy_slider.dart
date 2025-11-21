import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final int productId;
  const SpicySlider({
    super.key,
    required this.image,
    required this.title,
    required this.desc, required this.productId,
  });

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: widget.image,
            width: 200,
            placeholder: (context, url) {
              return SizedBox(
                width: 250,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Icon(Icons.error);
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CustomText(text: widget.title, weight: FontWeight.bold),
            const SizedBox(height: 10),
            SizedBox(
              width: 330,
              child: Text(
                widget.desc,
                style: TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
           ],
        ),
      ],
    );
  }
}
