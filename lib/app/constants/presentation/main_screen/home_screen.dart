import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/widgets/fake_search_widget.dart';


class HomeSareen extends StatefulWidget {
  const HomeSareen({super.key});

  @override
  State<HomeSareen> createState() => _HomeSareenState();
}

class _HomeSareenState extends State<HomeSareen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.white,
          title: const FakeSearchWidget(),
          // ignore: prefer_const_constructors
          bottom: TabBar(
              indicatorColor: AppColors.yellow,
              indicatorWeight: 8,
              isScrollable: true,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const RepeatedTabWidget(label: 'Men'),
                const RepeatedTabWidget(label: 'Women'),
                const RepeatedTabWidget(label: 'Shoes'),
                const RepeatedTabWidget(label: 'Bags'),
                const RepeatedTabWidget(label: 'Electroics'),
                const RepeatedTabWidget(label: 'Accessories'),
                const RepeatedTabWidget(label: 'Home & Garden'),
                const RepeatedTabWidget(label: 'Kids'),
                const RepeatedTabWidget(label: 'Beauty'),
              ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text('men screen')),
          Center(child: Text('womenscreen')),
          Center(child: Text('shoes screen')),
          Center(child: Text('bags screen')),
          Center(child: Text('electronics screen')),
          Center(child: Text('accessories screen')),
          Center(child: Text('home&gardenscreen')),
          Center(child: Text('kids screen')),
          Center(child: Text('beauty screen')),
        ]),
      ),
    );
  }
}

