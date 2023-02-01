import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/widgets/app_bar_widgets/appbar_back_button_widget.dart';
import 'package:shop_app/app/constants/presentation/widgets/app_bar_widgets/appbar_title_widget.dart';


class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const AppbarTitleWidget(
          title: 'Orders',
        ),
        leading: const AppbarBackButtonWidget(),
      ),
    );
  }
}
