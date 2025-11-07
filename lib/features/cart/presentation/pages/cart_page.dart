import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CartItem(
                      image: "assets/images/test.png",
                      text: "Hamburger",
                      desc: "Veggie Burger",
                      onAdd: () {},
                      onDelete: () {},
                      onRemove: () {},
                      number: 1,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(text: "Checkout", onPressed: () {}),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
