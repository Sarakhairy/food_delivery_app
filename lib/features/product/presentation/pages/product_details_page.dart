import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/features/cart/data/repos/cart_repo.dart';
import 'package:food_delivery_app/features/product/data/models/topping_model.dart';
import 'package:food_delivery_app/features/product/data/repos/product_repo.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/custom_button.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/spicy_slider.dart';
import 'package:food_delivery_app/features/product/presentation/widgets/topping_card.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class ProductDetailsPage extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final int productId;
  const ProductDetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.productId,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<ToppingModel>? toppings;
  List<ToppingModel>? options;
  double value = 0.5;
  List<int>? selectedToppings = [];
  List<int>? selectedOptions = [];
  bool isSelected = false;
  ProductRepo productRepo = ProductRepo();
  Future<void> getToppings() async {
    final res = await productRepo.getToppings();
    setState(() {
      toppings = res;
    });
  }

  Future<void> getOptions() async {
    final res = await productRepo.getOptions();

    setState(() {
      options = res;
    });
  }

  @override
  void initState() {
    getToppings();
    getOptions();
    super.initState();
  }

  CartRepo cartRepo = CartRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
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
              SpicySlider(
                image: widget.image,
                title: widget.title,
                desc: widget.desc,
                productId: widget.productId,
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
                  activeColor: value < 0.5
                      ? Colors.lightBlueAccent
                      : Colors.red,
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

              const SizedBox(height: 30),
              const CustomText(text: "Toppings", size: 20),
              const SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toppings?.length ?? 6,
                  itemBuilder: (context, index) {
                    final topping = toppings?[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ToppingCard(
                        imageUrl: topping?.image ?? "",
                        title: topping?.name ?? '',
                        isSelected: selectedToppings!.contains(topping?.id),
                        onAdd: () {
                          final id = topping?.id;
                          if (id != null) {
                            setState(() {
                              if (selectedToppings!.contains(id)) {
                                selectedToppings!.remove(id);
                              } else {
                                selectedToppings!.add(id);
                              }
                            });
                          }
                        },
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
                  itemCount: options?.length ?? 6,
                  itemBuilder: (context, index) {
                    final option = options?[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ToppingCard(
                        imageUrl: option?.image ?? "",
                        title: option?.name ?? "",
                        isSelected: selectedOptions!.contains(option?.id),
                        onAdd: () {
                          final id = option?.id;
                          if (id != null) {
                            setState(() {
                              if (selectedOptions!.contains(id)) {
                                selectedOptions!.remove(id);
                              } else {
                                selectedOptions!.add(id);
                              }
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              CustomButton(
                text: "Add to cart",
                onPressed: () async {
                  try {
                    final cartItem = CartModel(
                      productId: widget.productId,
                      quantity: 1,
                      spicy: value.toStringAsFixed(2),
                      toppings: selectedToppings ?? [],
                      options: selectedOptions ?? [],
                    );
                    await cartRepo.addToCart(
                      CartRequestModel(items: [cartItem]),
                    );
                    print(cartItem);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Added to cart successfully")));
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
