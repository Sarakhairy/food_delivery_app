import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/shared/custom_text.dart';
import 'package:food_delivery_app/shared/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignupPage({super.key});

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
                    const SizedBox(height: 50),
                    Image.asset('assets/images/logo.png', width: 300),
                    SizedBox(height: 50),
                    CustomTextField(
                      hint: "Name",
                      isPassword: false,
                      controller: nameController,
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    CustomTextField(
                      hint: "Confirm password",
                      isPassword: true,
                      controller: confirmPassController,
                      validator: (v) {
                        if (confirmPassController.text != passController.text) {
                          return "Passwords are't match";
                        }
                        if (confirmPassController.text.trim().isEmpty) {
                          return "Please confirm password";
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 60),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: CustomText(
                          text: "Sign Up",
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
