import 'package:flutter/material.dart';

import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String mainCategoryValue = maincateg.first;
  String subCategoryValue = women.first;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
                    items: women.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        mainCategoryValue = value!;
                      });
                    },
                  ),
                  const Text(
                    '* select subcategory',
                    style: TextStyle(
                      color: AppColors.red,
                    ),
                  ),
                  DropdownButton(
                    iconSize: 40,
                    iconDisabledColor: AppColors.red,
                    dropdownColor: AppColors.yellow.shade400,
                    value: subCategoryValue,
                    items: women.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        subCategoryValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//https://www.youtube.com/watch?v=tS5qdZ0frxg 25