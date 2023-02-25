import 'package:flutter/material.dart';

import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String mainCategoryValue = 'select category';
  String subCategoryValue = 'subcategory';
  List<String> subCategoryList = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: size.height * 0.30,
                  width: size.width * 0.5,
                  color: AppColors.blueGrey.shade100,
                  child: const Center(
                    child: Text(
                      'You have not \n \n picked images yet!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.25,
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            '* select main category',
                            style: TextStyle(
                              color: AppColors.red,
                            ),
                          ),
                          DropdownButton(
                            iconSize: 40,
                            iconDisabledColor: AppColors.red,
                            dropdownColor: AppColors.yellow.shade400,
                            value: mainCategoryValue,
                            items: maincateg
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              selectedMainCateg(value);
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            '* select subcategory',
                            style: TextStyle(
                              color: AppColors.red,
                            ),
                          ),
                          DropdownButton(
                            iconSize: 40,
                            iconEnabledColor: AppColors.red,
                            iconDisabledColor: AppColors.black,
                            dropdownColor: AppColors.yellow.shade400,
                            value: subCategoryValue,
                            items: subCategoryList
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectedMainCateg(String? value) {
    if (value == 'select category') {
      subCategoryList = [];
    } else if (value == 'men') {
      subCategoryList = men;
    } else if (value == 'women') {
      subCategoryList = men;
    } else if (value == 'electronics') {
      subCategoryList = electronics;
    } else if (value == 'accessories') {
      subCategoryList = accessories;
    } else if (value == 'shoes') {
      subCategoryList = shoes;
    } else if (value == 'home & garden') {
      subCategoryList = homeandgarden;
    } else if (value == 'kids') {
      subCategoryList = kids;
    } else if (value == 'bags') {
      subCategoryList = bags;
    }
    setState(() {
      mainCategoryValue = value!;
      subCategoryValue = 'subcategory';
    });
  }
}
