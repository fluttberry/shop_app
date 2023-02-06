import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/widgets/auth_widgets/text_form_field_widget.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'auth_widgets/auth_main_button_widget.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({super.key});

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  void _pickImageFromCamera() async {
    final _pickedImage = await _picker.pickImage(
      imageQuality: 95,
      maxHeight: 300,
      maxWidth: 300,
      source: ImageSource.camera,
    );
    setState(() {
      _imageFile = _pickedImage;
    });
  }

  late String _name;
  late String _email;
  late String _password;

  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  void showSnackBar() {
    _scaffoldKey.currentState!.showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.yellow,
        content: Text(
          'Please fill your blanks',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 40,
                          ),
                          child: CircleAvatar(
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(
                                    File(
                                      _imageFile!.path,
                                    ),
                                  ),
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
                                  _pickImageFromCamera();
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
                                  Icons.photo,
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
                            onChanged: (value) {
                              _name = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your full name';
                              }

                              return null;
                            },
                            keyBoardType: TextInputType.text,
                            hintText: 'Enter your full name',
                            labelText: 'Full Name',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormFieldWidget(
                            onChanged: (value) {
                              _email = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              } else if (value.isValidEmail() == false) {
                                return 'invalid email';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            hintText: 'Enter your email',
                            labelText: 'Email',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormFieldWidget(
                            onChanged: (value) {
                              _password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }

                              return null;
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
                          log(_name);
                          log(_email);
                          log(_password);
                        } else {
                          log('not valid');
                          showSnackBar();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\. ])([a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}

//https://www.youtube.com/watch?v=pS4nawewiX0 17