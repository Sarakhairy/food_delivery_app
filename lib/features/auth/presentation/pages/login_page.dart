import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';
import 'package:food_delivery_app/shared/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Image.asset('assets/images/logo.png', width: 300),
                    const SizedBox(height: 10),
                    const CustomText(
                      weight: FontWeight.w600,
                      text: 'Welcome Back, Discover The Fast Food',
                      color: Colors.white,
                      size: 13,
                    ),
                    SizedBox(height: 70),
                    CustomTextField(
                      hint: "Email address",
                      isPassword: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hint: "Password",
                      isPassword: true,
                      controller: passController,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 45),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            
                          }
                        },
                        child: CustomText(
                          text: "Login",
                          color: AppColors.primaryColor,
                          size: 15,
                          weight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
