import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/widgets/auth_widgets/text_form_field_widget.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'auth_widgets/auth_main_button_widget.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({super.key});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Form(
              key: _formKey,
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
                        TextFormFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your full name';
                            }
                          },
                          keyBoardType: TextInputType.text,
                          hintText: 'Enter your full name',
                          labelText: 'Full Name',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                          },
                          keyBoardType: TextInputType.emailAddress,
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                          },
                          keyBoardType: TextInputType.visiblePassword,
                          obscureText: passwordVisible
                              ? passwordVisible = false
                              : passwordVisible = true,
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          widget: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                  AuthMainButtonWidget(
                    mainButtonLabel: 'Sign Up',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        log('valid');
                      } else {
                        log('not valid');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
