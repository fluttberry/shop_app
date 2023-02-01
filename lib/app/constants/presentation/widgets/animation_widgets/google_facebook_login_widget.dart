import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';


class GooglefacebookLoginWidget extends StatelessWidget {
  const GooglefacebookLoginWidget({
    Key? key,
    required this.child,
    required this.lable,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final String lable;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: child,
          ),
          Text(
            lable,
            style: const TextStyle(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
