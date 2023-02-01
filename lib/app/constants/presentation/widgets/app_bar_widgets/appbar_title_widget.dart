import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';


class AppbarTitleWidget extends StatelessWidget {
  const AppbarTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppTextStyles.black28Acme,
      ),
    );
  }
}
