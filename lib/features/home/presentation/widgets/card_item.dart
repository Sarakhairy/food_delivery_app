import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String rate;
  const CardItem({
    super.key,
    required this.image,
    required this.name,
    required this.desc,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: 150,
                    placeholder: (context, url) {
                      return SizedBox(
                        width: 150,
                        height: 100,
                        child: Center(child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(name,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                
                Text(desc,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12,color: Colors.grey),),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 25),
                    CustomText(text: rate, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            radius: 18,
            child: Icon(CupertinoIcons.heart_fill, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
