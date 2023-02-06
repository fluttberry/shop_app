import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.widget,
    this.obscureText = false,
    required this.keyBoardType,
  });

  final String hintText;
  final String labelText;
  final Widget? widget;
  final bool obscureText;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: widget,
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.purple,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.deepPurpleAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
