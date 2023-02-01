import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';


class RedDividerWidget extends StatelessWidget {
  const RedDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        thickness: 1,
        color: AppColors.red,
      ),
    );
  }
}
