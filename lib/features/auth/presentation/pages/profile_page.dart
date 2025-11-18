import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/features/auth/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/login_page.dart';
import 'package:food_delivery_app/features/auth/presentation/widgets/profile_text_field.dart';
import 'package:food_delivery_app/shared/custom_snack.dart';
import 'package:food_delivery_app/shared/custom_text.dart';
import 'package:image_picker/image_picker.dart';
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
  bool isLoading = false;
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

  String? selectedImage;
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  Future<void> updateProfileData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final user = await authRepo.updateProfileData(
        name: name.text.trim(),
        email: email.text.trim(),
        address: address.text.trim(),
        imagePath: selectedImage,
        visa: visa.text.trim(),
      );

      setState(() {
        isLoading = false;
        userModel = user;
      });
      await getProfileData();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      String errorMsg = 'Failed to update profile';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
    }
  }

  bool logoutLoading = false;
  Future<void> logout() async {
    setState(() {
      logoutLoading = true;
    });
    await authRepo.logout();
    setState(() {
      logoutLoading = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
    );
  }

  bool isGuest = false;
  Future<void> autoLogin() async {
    final user = await authRepo.autoLogin();
    setState(() {
      isGuest = authRepo.isGuest;
    });
    if (user != null) {
      setState(() {
        userModel = user;
      });
    }
  }

  @override
  void initState() {
    autoLogin();
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
    return isGuest
        ? Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("Your are a Guest, Login to Continue"),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    fixedSize: Size(170, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          )
        : RefreshIndicator(
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
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: userModel == null
                                        ? AssetImage('assets/images/user.jpeg')
                                        : selectedImage == null
                                        ? NetworkImage(userModel!.image!)
                                              as ImageProvider
                                        : FileImage(File(selectedImage!)),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.primaryColor,
                                  ),
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: pickImage,
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ProfileTextField(hintText: "Name", controller: name),
                        const SizedBox(height: 25),
                        ProfileTextField(hintText: "Email", controller: email),
                        const SizedBox(height: 25),
                        ProfileTextField(
                          hintText: "Address",
                          controller: address,
                        ),
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
                                  text: userModel!.visa!,
                                  color: Colors.black,
                                ),
                                trailing: CustomText(
                                  text: "Default",
                                  color: Colors.black,
                                ),
                              ),
                        SizedBox(height: 20),
                        ListTile(
                          onTap: updateProfileData,
                          tileColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.primaryColor),
                          ),
                          title: CustomText(
                            text: "Edit Profile",
                            color: Colors.white,
                          ),
                          trailing: isLoading
                              ? SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  CupertinoIcons.pencil,
                                  color: Colors.white,
                                ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          onTap: logout,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.primaryColor),
                          ),
                          title: CustomText(
                            text: "Logout",
                            color: AppColors.primaryColor,
                          ),
                          trailing: logoutLoading
                              ? SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : Icon(
                                  Icons.logout,
                                  color: AppColors.primaryColor,
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
