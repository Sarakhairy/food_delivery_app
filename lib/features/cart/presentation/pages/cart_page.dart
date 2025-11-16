import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery_app/features/cart/presentation/widgets/custom_button.dart';
import 'package:food_delivery_app/features/checkout/presentation/pages/checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
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
                SizedBox(height: 100,)
            ],
          ),
        ),
      
    );
  }
}
