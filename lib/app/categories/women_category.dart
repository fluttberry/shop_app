import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/constants/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class WomenCategory extends StatelessWidget {
  const WomenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const CategoryHeaderLable(headerLable: 'FOR WOMEN'),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 70,
                  crossAxisSpacing: 15,
                  crossAxisCount: 3,
                  children: List.generate(women.length, (index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image(
                            image: AssetImage('images/women/women$index.jpg'),
                          ),
                        ),
                        Text(women[index]),
                      ],
                    );
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
          child: const SliderWidget(mainSliderText: 'for women'),
        ),
      ],
    );
  }
}
