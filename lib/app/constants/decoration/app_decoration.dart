import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class AppDecoration {
  // ignore: prefer_const_constructors
  static Decoration welcomeDecoration = BoxDecoration(
    image: const DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('images/inapp/bgimage.jpg'),
    ),
  );
  static Decoration purple20Decration = BoxDecoration(
    borderRadius: BorderRadius.circular(20.0),
    color: AppColors.purple,
  );
  // ignore: prefer_const_constructors
  static Decoration purple15bottom = BoxDecoration(
    color: AppColors.purple,
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
  );
  static Decoration purple15top = const BoxDecoration(
    color: AppColors.purple,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  );
}
