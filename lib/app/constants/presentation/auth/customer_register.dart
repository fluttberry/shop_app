import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/decoration/app_decoration.dart';
import 'package:shop_app/app/constants/presentation/widgets/auth_widgets/text_form_field_widget.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({super.key});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                          Navigator.pushReplacementNamed(
                              context, '/welcome_screen');
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
                        vertical: 30,
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
                    children: [
                      const TextFormFieldWidget(
                        hintText: 'Enter your full name',
                        labelText: 'Full Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextFormFieldWidget(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldWidget(
                        obscureText: true,
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.visibility_off,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'already have account?',
                            style: AppTextStyles.black16Italic,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Log In',
                            style: AppTextStyles.purple20Bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Container(
                  // ignore: sort_child_properties_last
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.white20,
                    ),
                  ),
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: AppDecoration.purple20Decration,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//https://www.youtube.com/watch?v=OoiJCnPbWj0 1-15