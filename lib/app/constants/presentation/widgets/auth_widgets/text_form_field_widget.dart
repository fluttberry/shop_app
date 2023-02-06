import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.onChanged,
    this.widget,
    this.obscureText = false,
    required this.keyBoardType,
  });
  final Function(String)? onChanged;
  final String hintText;
  final String labelText;
  final Widget? widget;
  final bool obscureText;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
