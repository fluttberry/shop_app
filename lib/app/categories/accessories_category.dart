import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/constants/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shop_app/app/utilities/categ_list.dart';


import '../constants/presentation/widgets/category_widgets/sub_category_model.dart';

class AccessoriesCategory extends StatelessWidget {
  const AccessoriesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              CategoryHeaderLable(headerLable: 'ACCESSORIES'),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 70,
                  crossAxisSpacing: 15,
                  crossAxisCount: 3,
                  children: List.generate(accessories.length, (index) {
                    return SubCategoryModel(
                        mainCategotyName: 'accessories',
                        subCategotyName: accessories[index],
                        assetName: 'images/accessories/accessories$index.jpg',
                        subCategotyLable: accessories[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        Positioned(
          bottom: 0,
          right: 0,
          child: const SliderWidget(mainSliderText: 'accessories'),
        ),
      ],
    );
  }
}
