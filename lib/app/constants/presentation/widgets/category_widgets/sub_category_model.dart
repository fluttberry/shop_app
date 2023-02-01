import 'package:flutter/material.dart';

import '../../minor screens/sub_category_product_screen.dart';

class SubCategoryModel extends StatelessWidget {
  const SubCategoryModel({
    Key? key,
    required this.subCategotyName,
    required this.mainCategotyName,
    required this.assetName,
    required this.subCategotyLable,
  }) : super(key: key);

  final String subCategotyName;
  final String mainCategotyName;
  final String assetName;
  final String subCategotyLable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryProductScreen(
              subCategotyName: subCategotyName,
              mainCategotyName: mainCategotyName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(subCategotyLable),
        ],
      ),
    );
  }
}
