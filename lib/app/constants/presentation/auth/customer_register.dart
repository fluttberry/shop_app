import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/widgets/auth_widgets/text_form_field_widget.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({super.key});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/welcome_screen');
                  },
                  icon: const Icon(
                    Icons.home_work,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.purpleAccent,
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        log('pick image from camera');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        log('pick image from gallery');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: const [
                TextFormFieldWidget(
                  hintText: 'Enter your full name',
                  labelText: 'Full Name',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormFieldWidget(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormFieldWidget(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//https://www.youtube.com/watch?v=OoiJCnPbWj0 53