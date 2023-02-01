import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/main_screen/customer_screen.dart';
import 'package:shop_app/app/constants/presentation/widgets/app_bar_widgets/appbar_title_widget.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const AppbarTitleWidget(title: 'Cart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Your Cart Is Empty!',
              style: AppTextStyles.black30Regular,
            ),
            const SizedBox(
              height: 50,
            ),
            Material(
              color: AppColors.lightBlueAccent,
              borderRadius: BorderRadius.circular(25),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const CustomerScreen()),
                    ),
                  );
                },
                child: const Text(
                  'Continue shopping',
                  style: AppTextStyles.white18Regular,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Total \$',
                style: AppTextStyles.white18Regular,
              ),
              const Text(
                '00.00',
                style: AppTextStyles.red20Bold,
              ),
            ],
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.yellow,
            ),
            child: MaterialButton(
              onPressed: () {},
              child: const Text('CHECK OUT'),
            ),
          ),
        ],
      ),
    );
  }
}
