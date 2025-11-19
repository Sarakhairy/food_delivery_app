import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
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
  const ProductDetailsPage({
    super.key,
    required this.image,
    required this.title, required this.desc,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<ToppingModel>? toppings;
  List<ToppingModel>? options;
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
              const SizedBox(height: 10),
              SpicySlider(image: widget.image, title: widget.title,desc: widget.desc,),
              const SizedBox(height: 50),
              const CustomText(text: "Toppings", size: 20),
              const SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toppings?.length ?? 0,
                  itemBuilder: (context, index) {
                    final topping = toppings?[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ToppingCard(
                        imageUrl: topping?.image ?? "",
                        title: topping?.name ?? '',
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
                  itemCount: options?.length ?? 0,
                  itemBuilder: (context, index) {
                    final option = options?[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ToppingCard(
                        imageUrl: option?.image ?? "",
                        title: option?.name ?? "",
                        onAdd: () {},
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 70),

              CustomButton(text: "Add to cart", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
