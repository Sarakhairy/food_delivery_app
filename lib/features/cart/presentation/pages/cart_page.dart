import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/features/cart/data/repos/cart_repo.dart';
import 'package:food_delivery_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery_app/features/cart/presentation/widgets/custom_button.dart';
import 'package:food_delivery_app/features/checkout/presentation/pages/checkout_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GetCartResponse? cartResponse;
  CartRepo cartRepo = CartRepo();
  Future<void> getCartData() async {
    final res = await cartRepo.getCartData();
    setState(() {
      cartResponse = res;
    });
  }

  @override
  void initState() {
    getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: cartResponse == null,
      child: Scaffold(
        appBar: AppBar(title: Text("My Cart"), centerTitle: true,scrolledUnderElevation: 0.0,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartResponse?.data.items.length ?? 5,
                  itemBuilder: (context, index) {
                    final item = cartResponse?.data.items[index];
                    return CartItem(
                      image: item?.image??"",
                      text: item?.name??'',
                      spicy: item?.spicy??'',
      
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
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
