import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/pages/login_page.dart';
import 'package:food_delivery_app/root.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthRepo authRepo = AuthRepo();
  Future<void> _checkLogin() async {
    final user = await authRepo.autoLogin();
    if (authRepo.isGuest) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return Root();
          },
        ),
      );
    } else if (user!= null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return Root();
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), _checkLogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F5),
      body: Center(child: Image.asset('assets/images/logo.png', width: 250)),
    );
  }
}
