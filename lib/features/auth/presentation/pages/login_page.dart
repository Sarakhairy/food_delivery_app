import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/signup_page.dart';
import 'package:food_delivery_app/features/auth/presentation/widgets/buttons.dart';
import 'package:food_delivery_app/root.dart';
import 'package:food_delivery_app/shared/custom_snack.dart';
import 'package:food_delivery_app/shared/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final user = await authRepo.login(
          emailController.text.trim(),
          passController.text.trim(),
        );
        if (user != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Root();
              },
            ),
          );
        }
      } catch (e) {
         ScaffoldMessenger.of(context).showSnackBar(
        customSnack(e is ApiError ? e.message : 'Unhandled login error'),
      );
      
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/logo.png',
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome Back 🍔",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Discover delicious fast food near you",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: emailController,
                        hint: "Email address",
                        isPassword: false,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passController,
                        hint: "Password",
                        isPassword: true,
                      ),
                      const SizedBox(height: 35),
                      isLoading
                          ? CircularProgressIndicator.adaptive()
                          : SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF5722),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5,
                                ),
                                onPressed: login,
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 30),
                      WelcomeButtons(
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SignupPage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
