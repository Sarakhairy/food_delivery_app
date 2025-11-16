import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/network/api_error.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/widgets/buttons.dart';
import 'package:food_delivery_app/root.dart';
import 'package:food_delivery_app/shared/custom_snack.dart';
import 'package:food_delivery_app/shared/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController confirmPassController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final user = await authRepo.signup(
          nameController.text.trim(),
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
        print('user $e  .................');
        String errorMsg = "unhandled error in register";
        if (e is ApiError) {
          errorMsg = e.message.toString();
          errorMsg = e.message;
        }
        customSnack(errorMsg);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 180, height: 180),
                const SizedBox(height: 20),
                const Text(
                  "Create Your Account 🍕",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Join us & order your favorite meals easily",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hint: "Full Name",
                        isPassword: false,
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: confirmPassController,
                        hint: 'Confirm password',
                        isPassword: true,
                      ),
                      const SizedBox(height: 35),

                      // Sign Up Button
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
                                onPressed: signUp,
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 25),
                      WelcomeButtons(
                        text: "Login",
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
