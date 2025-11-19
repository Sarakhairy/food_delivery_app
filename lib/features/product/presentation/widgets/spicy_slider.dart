import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  const SpicySlider({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: widget.image,
            width: 170,
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: widget.title, weight: FontWeight.bold),
              Text(
                widget.desc,
                style: TextStyle(fontSize: 10, color: Colors.grey),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                child: Slider(
                  min: 0,
                  max: 1,
                  onChanged: (v) {
                    setState(() {
                      value = v;
                    });
                  },
                  value: value,
                  activeColor: value < 0.5 ? Colors.lightBlueAccent : Colors.red,
                  inactiveColor: Colors.grey.shade300,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Colors.lightBlueAccent,
                      size: value < 0.5 ? 30 : 24,
                    ),
                    Icon(
                      Icons.whatshot,
                      color: Colors.red,
                      size: value > 0.5 ? 30 : 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
