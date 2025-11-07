import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/custom_button.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/spicy_slider.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/topping_card.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpicySlider(),
              const SizedBox(height: 50),
              const CustomText(text: "Toppings", size: 20),
              const SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ToppingCard(
                        imageUrl: "assets/images/tomato.png",
                        title: 'Tomato',
                        onAdd: () {},
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(text: "Side Options", size: 20),
              const SizedBox(height: 20),

              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ToppingCard(
                        imageUrl: "assets/images/tomato.png",
                        title: 'Tomato',
                        onAdd: () {},
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(text: "Add to cart", onPressed: () {}),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
