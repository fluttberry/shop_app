import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/dashboard_components/balance.dart';
import 'package:shop_app/app/constants/presentation/dashboard_components/edit_profile.dart';
import 'package:shop_app/app/constants/presentation/dashboard_components/manage_products.dart';
import 'package:shop_app/app/constants/presentation/dashboard_components/my_store.dart';
import 'package:shop_app/app/constants/presentation/dashboard_components/orders.dart';
import 'package:shop_app/app/constants/presentation/dashboard_components/statics.dart';
import 'package:shop_app/app/constants/presentation/widgets/app_bar_widgets/appbar_title_widget.dart';


List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];
List<String> lable = [
  'my store'
      'order'
      'edit profile'
      'manage products'
      'balance'
      'statics'
];
List<Widget> pages = [
  const MyStore(),
  const Orders(),
  const EditProfile(),
  const ManageProducts(),
  const Balance(),
  const Statics(),
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const AppbarTitleWidget(
          title: 'dashborad',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(
            6,
            (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pages[index],
                    ),
                  );
                },
                child: Card(
                  shadowColor: AppColors.purpleAccent,
                  elevation: 20,
                  color: AppColors.blueGrey.withOpacity(0.7),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: AppColors.yellowAccent,
                      ),
                      Text(
                        lable[index].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.yellowAccent,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

