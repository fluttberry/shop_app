import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppTextStyles {
  // ignore: prefer_const_constructors
  static const TextStyle brown16Bold = TextStyle(
    color: AppColors.brown,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  static const TextStyle black28Acme = TextStyle(
    fontSize: 28,
    color: AppColors.black,
    fontFamily: 'Acme',
    letterSpacing: 1.5,
  );

  static const TextStyle black30Regular = TextStyle(
    fontSize: 30,
  );

  static const TextStyle white18Regular = TextStyle(
    fontSize: 18,
  );

  static const TextStyle red20Bold = TextStyle(
    fontSize: 20,
    color: AppColors.red,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle grey25W700 = TextStyle(
    color: Colors.grey,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle purple15Bold = TextStyle(
    color: AppColors.purple,
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );
  static const TextStyle red25Acme = TextStyle(
    fontSize: 25.0,
    color: Colors.red,
    fontFamily: 'Acme',
    letterSpacing: 1.5,
  );
  static const TextStyle white15Bold = TextStyle(
    fontSize: 15.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white20 = TextStyle(
    fontSize: 20.0,
    color: AppColors.white,
  );
  static const TextStyle bold40 = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle yellowAccent24w600Acme = TextStyle(
      fontSize: 24.0,
      color: AppColors.yellowAccent,
      fontWeight: FontWeight.w600,
      letterSpacing: 2,
      fontFamily: 'Acme');
}
