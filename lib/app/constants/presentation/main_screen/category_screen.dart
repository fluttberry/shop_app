import 'package:flutter/material.dart';
import 'package:shop_app/app/categories/accessories_category.dart';
import 'package:shop_app/app/categories/bags_category.dart';
import 'package:shop_app/app/categories/beauty_category.dart';
import 'package:shop_app/app/categories/electronics_category.dart';
import 'package:shop_app/app/categories/home_and_garden.dart';
import 'package:shop_app/app/categories/kids_category.dart';
import 'package:shop_app/app/categories/men_category.dart';
import 'package:shop_app/app/categories/shoes_category.dart';
import 'package:shop_app/app/categories/women_category.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/widgets/fake_search_widget.dart';

List<ItemsData> items = [
  ItemsData(lable: 'men'),
  ItemsData(lable: 'women'),
  ItemsData(lable: 'shoes'),
  ItemsData(lable: 'bags'),
  ItemsData(lable: 'electronicts'),
  ItemsData(lable: 'accessories'),
  ItemsData(lable: 'home & garden'),
  ItemsData(lable: 'kids'),
  ItemsData(lable: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.white,
        title: const FakeSearchWidget(),
      ),
      body: Stack(children: [
        Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
        Positioned(bottom: 0, right: 0, child: categoryView(size)),
        // const Positioned(bottom: 0, right: 0, child: Text('')),
      ]),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              for (var element in items) {
                element.isSelected = false;
              }
              setState(() {
                items[index].isSelected = true;
              });
              // _pageController.jumpToPage(index);
              _pageController.animateToPage(index,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn);
            },
            // ignore: avoid_unnecessary_containers
            child: Container(
              height: 100,
              color: items[index].isSelected == true
                  ? AppColors.white
                  : AppColors.yellow.withOpacity(0.5),
              child: Center(
                child: Text(items[index].lable),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget categoryView(Size size) {
    return Container(
      color: AppColors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        onPageChanged: (selectedSideBar) {
          for (var sideBarIndex in items) {
            sideBarIndex.isSelected = false;
          }
          setState(() {
            items[selectedSideBar].isSelected = true;
          });
        },
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeAndGarden(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String lable;
  bool isSelected;
  ItemsData({
    required this.lable,
    this.isSelected = false,
  });
}
