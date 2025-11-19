import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/home/data/models/product_model.dart';
import 'package:food_delivery_app/features/home/data/repos/home_repo.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/card_item.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/categories_widget.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/search_widget.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/user_header.dart';
import 'package:food_delivery_app/features/product/presentation/pages/product_details_page.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? products;
  HomeRepo homeRepo = HomeRepo();
  Future<void> getProducts() async {
    final res = await homeRepo.getProducts();
    setState(() {
      products = res;
    });
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      const UserHeader(),
                      const SearchWidget(),
                      const SizedBox(height: 25),
                      const CategoriesWidget(),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 100),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: products?.length ?? 0,
                  (context, index) {
                    final product = products?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(image: product?.image??"",title: product?.name??"",desc: product?.desc??"",);
                            },
                          ),
                        );
                      },
                      child: CardItem(
                        image: product?.image?? "",
                        name: product?.name?? "",
                        desc: product?.desc ?? "",
                        rate: product?.rate??"",
                      ),
                    );
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.69,
                  mainAxisSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
