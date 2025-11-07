import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/login_page.dart';
import 'package:food_delivery_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery_app/features/checkout/presentation/pages/checkout_page.dart';
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

                      onRemove: () {},
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: "Checkout",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CheckoutPage();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
