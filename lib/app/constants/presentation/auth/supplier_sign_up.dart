// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/auth/auth_snack_bar_widget/my_message_handler.dart';
import 'package:shop_app/app/constants/presentation/auth/auth_widgets/have_account_widget.dart';
import 'package:shop_app/app/constants/presentation/widgets/auth_widgets/text_form_field_widget.dart';
import 'auth_widgets/auth_main_button_widget.dart';

class SuppliersSignUp extends StatefulWidget {
  const SuppliersSignUp({super.key});

  @override
  State<SuppliersSignUp> createState() => _SuppliersSignUpState();
}

class _SuppliersSignUpState extends State<SuppliersSignUp> {
  final ImagePicker _picker = ImagePicker();
  late String _storeName;
  late String _email;
  late String _password;
  late String _uid;
  late String _storeLogo;
  bool processing = false;

  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  XFile? _imageFile;
  dynamic _pickedImageError;
  void _pickImageFromCamera() async {
    try {
      final _pickedImage = await _picker.pickImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
        source: ImageSource.camera,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  void _pickImageFromGallery() async {
    try {
      final _pickedImage = await _picker.pickImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
        source: ImageSource.gallery,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  CollectionReference suppliers =
      FirebaseFirestore.instance.collection('suppliers');

  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          // ignore: unused_local_variable
          // final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          );
          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('suppliers-image/$_email.jpg');
          await ref.putFile(File(_imageFile!.path));
          _storeLogo = await ref.getDownloadURL();
          _uid = FirebaseAuth.instance.currentUser!.uid;
          suppliers.doc(_uid).set({
            'namw': _storeName,
            'email': _email,
            'phone': '',
            'address': '',
            'profileImage': _storeLogo,
            'cid': _uid,
          });
          Navigator.pushReplacementNamed(context, '/supplier_singup_screen');
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
              _scaffoldKey,
              'The password provided is too weak.',
            );
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
              _scaffoldKey,
              'The account already exists for that email.',
            );
            log(
              'The account already exists for that email.',
            );
          }
        } catch (e) {
          print(e);
        }
      } else {
        setState(() {
          processing = false;
        });
        MyMessageHandler.showSnackBar(
            _scaffoldKey, 'Please pick an image first');
      }
    } else {
      setState(() {
        processing = false;
      });
      log('not valid');
      MyMessageHandler.showSnackBar(_scaffoldKey, 'Not Valid');
    }
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
                                  _pickImageFromGallery();
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
                              _storeName = value;
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
                          HaveAccountWidget(
                            haveAccount: 'Already Have Account?',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/supplier_login_screen');
                            },
                            actionLabel: 'Log In',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    processing == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.purple,
                            ),
                          )
                        : AuthMainButtonWidget(
                            mainButtonLabel: 'Sign Up',
                            onTap: () async {
                              signUp();
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
