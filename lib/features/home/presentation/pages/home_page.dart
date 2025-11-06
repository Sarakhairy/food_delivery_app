import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/card_item.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/categories_widget.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/search_widget.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/user_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(childCount: 6, (
                    context,
                    index,
                  ) {
                    return CardItem(
                      image: "assets/images/test.png",
                      name: "Cheeseburger",
                      desc: "Wendy's Burger",
                      rate: "4.9",
                    );
                  }),
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
      ),
    );
  }
}
