import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
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
                children: const [
                  Text(
                    '* select main category',
                    style: TextStyle(
                      color: AppColors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
