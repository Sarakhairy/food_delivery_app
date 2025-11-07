import 'package:flutter/material.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 120, top: 10),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/test.png", width: 100),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Hamburger",
                                weight: FontWeight.bold,
                                size: 18,
                              ),
                              CustomText(text: "Quantity: X3",color: Colors.grey,),
                              CustomText(text: 'Price: 20\$',color: Colors.grey,),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(double.infinity, 50),
                            backgroundColor:  Colors.white,
                            foregroundColor:  Color(0xff2e7d32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              
                            )
                            ,
                            side: BorderSide(
                              color: Color(0xff2e7d32),
                              width: 2
                            ),
                            
                            elevation: 4,
                          ),
                          onPressed: () {},
                          child: const CustomText(
                            text: "Order Again",
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
