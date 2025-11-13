import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.validator,
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
      validator: widget.validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please fill ${widget.hint}";
            }
            return null; 
          },
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
