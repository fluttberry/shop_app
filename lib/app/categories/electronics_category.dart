import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/constants/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shop_app/app/utilities/categ_list.dart';
import '../constants/presentation/widgets/category_widgets/sub_category_model.dart';

class ElectronicsCategory extends StatelessWidget {
  const ElectronicsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              CategoryHeaderLable(headerLable: 'ELECTRONICS'),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 70,
                  crossAxisSpacing: 15,
                  crossAxisCount: 3,
                  children: List.generate(electronics.length, (index) {
                    return SubCategoryModel(
                        mainCategotyName: 'electronics',
                        subCategotyName: electronics[index],
                        assetName: 'images/electronics/electronics$index.jpg',
                        subCategotyLable: electronics[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: SliderWidget(mainSliderText: 'electronics'),
        ),
      ],
    );
  }
}
