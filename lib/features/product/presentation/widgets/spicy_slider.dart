import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key});

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
        Image.asset("assets/images/sandwitch_detail.png", height: 250),
        Expanded(
          child: Column(
            children: [
              const CustomText(
                text:
                    "Customize your burger\nto your Testes.\nultimate experience",
                weight: FontWeight.bold,
              ),
              Slider(
                min: 0,
                max: 1,
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                value: value,
                activeColor: value< 0.5?Colors.lightBlueAccent: Colors.red,
                inactiveColor: Colors.grey.shade300,
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.ac_unit, color: Colors.lightBlueAccent,size: value < 0.5?30: 24,),
                    Icon(Icons.whatshot, color: Colors.red,size: value >0.5?30: 24),
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
