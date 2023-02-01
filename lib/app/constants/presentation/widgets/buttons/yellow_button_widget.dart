import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';


class YellowButtonWidget extends StatelessWidget {
  const YellowButtonWidget({
    Key? key,
    required this.lable,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  final String lable;
  final Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(lable),
        ),
      ),
    );
  }
}
