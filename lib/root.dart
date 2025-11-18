import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/profile_page.dart';
import 'package:food_delivery_app/features/cart/presentation/pages/cart_page.dart';
import 'package:food_delivery_app/features/home/presentation/pages/home_page.dart';
import 'package:food_delivery_app/features/orderHistory/presentation/pages/order_history_page.dart';

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;

  late List<Widget> screens;
  int currentScreen = 0;
  @override
  void initState() {
    screens = [HomePage(), CartPage(), OrderHistoryPage(), ProfilePage()];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: controller,
        children: screens,
        physics: NeverScrollableScrollPhysics(),
      ),
     bottomNavigationBar: Padding(
  padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  child: Container(
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          offset: Offset(0, 4),
        )
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,

        currentIndex: currentScreen,

        showSelectedLabels: true,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_restaurant_sharp),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(index);
        },
      ),
    ),
  ),
),
 );
  }
}
