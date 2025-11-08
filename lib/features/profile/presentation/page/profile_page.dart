import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:food_delivery_app/shared/custom_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final TextEditingController name = TextEditingController(text: 'Knuckles');
  final TextEditingController email = TextEditingController(text: 'Knuckles@gmail.com');
  final TextEditingController address = TextEditingController(text: '55 Dubai. UAE');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/user.jpeg'),
                  ),
                  border: Border.all(width: 5, color: Colors.white),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ProfileTextField(hintText: "Name", controller: name),
            const SizedBox(height: 25),
            ProfileTextField(hintText: "Email", controller: email),
            const SizedBox(height: 25),
            ProfileTextField(hintText: "Address", controller: address),
            const SizedBox(height: 20),
            Divider(),
            const SizedBox(height: 10),
            ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                tileColor: Colors.white,
                leading: Image.asset(
                  "assets/images/profileVisa.png",
                  width: 50,
                ),
                title: CustomText(text: 'Debit Card', color: Colors.black),
                subtitle: CustomText(
                  text: "**** **** 2342",
                  color: Colors.black,
                ),
                trailing: CustomText(text: "Default",color: Colors.black,)
                
              ),
             
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  CustomText(text: "Edit Profile",color: Colors.white,),
                  Icon(CupertinoIcons.pencil,color: Colors.white,)
                ],
              ),
            ),
                        Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primaryColor)
              ),
              child: Row(
                children: [
                  CustomText(text: "Logout",color: AppColors.primaryColor,),
                  const SizedBox(width: 5,),
                  Icon(Icons.logout,color: AppColors.primaryColor,)
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
