import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/features/auth/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/widgets/profile_text_field.dart';
import 'package:food_delivery_app/shared/custom_snack.dart';
import 'package:food_delivery_app/shared/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController name = TextEditingController(text: 'Knuckles');

  final TextEditingController email = TextEditingController(
    text: 'Knuckles@gmail.com',
  );

  final TextEditingController address = TextEditingController(
    text: '55 Dubai. UAE',
  );
  final TextEditingController visa = TextEditingController();

  AuthRepo authRepo = AuthRepo();
  UserModel? userModel;
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
      });
    } catch (e) {
      String errorMsg = "Error in profile";
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
    }
  }

  @override
  void initState() {
    getProfileData().then((v) {
      name.text = userModel?.name.toString() ?? 'Knuckles';
      email.text = userModel?.email.toString() ?? 'Knuckles@gmail.com';
      address.text = userModel?.address.toString() == null
          ? '55 Dubai, UAE'
          : userModel!.address.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: AppColors.primaryColor,
      onRefresh: () async {
        await getProfileData();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8F5),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.settings, color: Colors.black),
            ),
          ],
          backgroundColor: const Color(0xFFFFF8F5),
          scrolledUnderElevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: [
            const SizedBox(height: 10),
            Skeletonizer(
              enabled: userModel == null,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: userModel == null
                              ? AssetImage('assets/images/user.jpeg')
                              : NetworkImage(userModel!.image!)
                                    as ImageProvider,
                        ),
                        border: Border.all(
                          width: 1,
                          color: AppColors.primaryColor,
                        ),
                        color: Colors.grey,
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
                  const SizedBox(height: 20),
                  (userModel?.visa == null || userModel!.visa!.isEmpty)
                      ? ProfileTextField(
                          hintText: "Add visa card",
                          controller: visa,
                          keyboardType: TextInputType.number,
                        )
                      : ListTile(
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
                          title: CustomText(
                            text: 'Debit Card',
                            color: Colors.black,
                          ),
                          subtitle: CustomText(
                            text: "**** **** 2342",
                            color: Colors.black,
                          ),
                          trailing: CustomText(
                            text: "Default",
                            color: Colors.black,
                          ),
                        ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8F5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              CustomText(
                                text: "Edit Profile",
                                color: Colors.white,
                              ),
                              Icon(CupertinoIcons.pencil, color: Colors.white),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: Row(
                            children: [
                              CustomText(
                                text: "Logout",
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.logout, color: AppColors.primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
