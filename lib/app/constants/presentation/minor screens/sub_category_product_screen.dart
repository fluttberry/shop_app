import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';


class SubCategoryProductScreen extends StatelessWidget {
  const SubCategoryProductScreen({
    super.key,
    required this.subCategotyName,
    required this.mainCategotyName,
  });

  final String subCategotyName;
  final String mainCategotyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          ),
        ),
        title: Text(
          subCategotyName,
          style: const TextStyle(color: AppColors.black),
        ),
      ),
      body: Center(
        child: Text(mainCategotyName),
      ),
    );
  }
}
