import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/checkout/presentation/widgets/checkout_dialog.dart';
import 'package:food_delivery_app/features/checkout/presentation/widgets/checkout_widget.dart';
import 'package:food_delivery_app/features/checkout/presentation/widgets/custom_bottom_sheet.dart';
import 'package:food_delivery_app/features/checkout/presentation/widgets/payment_button.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Order summary",
                size: 20,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 10),
              CheckoutWidget(title: "Order", price: '18 \$'),
              const SizedBox(height: 10),
              CheckoutWidget(title: "Taxes", price: '3.5 \$'),
              const SizedBox(height: 10),
              CheckoutWidget(title: "Delivery fees", price: '2.4 \$'),
              const SizedBox(height: 10),
              Divider(),
              const SizedBox(height: 10),
              CheckoutWidget(title: "Total", price: '100.00 \$', isBold: true),
              const SizedBox(height: 10),
              CheckoutWidget(
                title: "Estimated delivery time",
                price: '15 - 30 mins',
                isSmall: true,
                isBold: true,
              ),
              const SizedBox(height: 80),
              CustomText(
                text: "Payment methods",
                size: 20,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 15),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                tileColor: Color(0xff3c2f2f),
                leading: Image.asset("assets/images/cash.png", width: 50),
                title: CustomText(
                  text: 'Cash on Delivery',
                  color: Colors.white,
                ),
                trailing: Radio(
                  activeColor: Colors.white,
                  value: "Cash",
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                tileColor: Colors.blue.shade900,
                leading: Image.asset(
                  "assets/images/profileVisa.png",
                  width: 50,
                ),
                title: CustomText(text: 'Debit Card', color: Colors.white),
                subtitle: CustomText(
                  text: "**** **** 2342",
                  color: Colors.white,
                ),
                trailing: Radio(
                  activeColor: Colors.white,
                  value: "Visa",
                  groupValue: selectedMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedMethod = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffef2a39),
                    value: true,
                    onChanged: (v) {},
                  ),
                  CustomText(text: "Save card details for future payments"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: CustomBottomSheet() );
  }
}
