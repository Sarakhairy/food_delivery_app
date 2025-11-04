import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/home/presentation/widgets/card_item.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category = ['All', "Combo", "Sliders", "Classic"];
  int selectedIndex = 0;
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
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/logo.png', width: 90),
                                CustomText(
                                  text: "Hello, Sarah Khairy",
                                  size: 16,
                                  weight: FontWeight.w500,
                                  color: Colors.grey.shade500,
                                ),
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(radius: 31),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.search),
                              hintText: "Search..",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: category.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  selectedIndex = index;
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? AppColors.primaryColor
                                        : Color(0xffF3F4F6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 27,
                                    vertical: 15,
                                  ),
                                  child: CustomText(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    text: category[index],
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                    (context, index) {
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
