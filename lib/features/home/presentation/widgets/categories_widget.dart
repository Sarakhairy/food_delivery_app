import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
    List category = ['All', "Combo", "Sliders", "Classic"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                          height: 50,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: category.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  selectedIndex = index;
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? AppColors.primaryColor
                                        : Color(0xffF3F4F6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 27,
                                    vertical: 15,
                                  ),
                                  child: CustomText(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    text: category[index],
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
  }
}