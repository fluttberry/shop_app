import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';


class ProfileHeaderLableWidget extends StatelessWidget {
  const ProfileHeaderLableWidget({
    Key? key,
    required this.headerlable,
  }) : super(key: key);

  final String headerlable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: AppColors.grey,
            ),
          ),
          Text(
            headerlable,
            style: const TextStyle(
              color: AppColors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
