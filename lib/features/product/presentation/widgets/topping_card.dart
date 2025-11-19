import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;

  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xff3c2F2F),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: onAdd,
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.add, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
            SizedBox(
              height: 90,
              child: Center(
                child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: imageUrl,
                        
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
            ),
                
           
        ],
      ),
    );
  }
}
