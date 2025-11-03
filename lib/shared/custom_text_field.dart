import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20,
      obscureText: _obscureText,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "Please fill ${widget.hint}";
        }
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText? Icon(Icons.visibility): Icon(Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
