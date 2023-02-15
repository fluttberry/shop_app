// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/decoration/app_decoration.dart';
import 'package:shop_app/app/constants/presentation/widgets/animation_widgets/animated_logo_widget.dart';
import 'package:shop_app/app/constants/presentation/widgets/animation_widgets/google_facebook_login_widget.dart';
import 'package:shop_app/app/constants/presentation/widgets/buttons/yellow_button_widget.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.yellowAccent,
  Colors.green,
  Colors.green,
  Colors.teal,
];

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.welcomeDecoration,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Welcome',
                    textStyle: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Acme'),
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'Duck Store',
                    textStyle: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Acme'),
                    colors: textColors,
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(
                  image: AssetImage('images/inapp/logo.jpg'),
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightBlueAccent,
                    fontFamily: 'Acme'),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText('Buy'),
                    RotateAnimatedText('Shop'),
                    RotateAnimatedText('Duck Store'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Suppliers only',
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              height: 70,
                              child:
                                  AnimatedLogoWidget(controller: _controller),
                            ),
                            YellowButtonWidget(
                              lable: 'Log In',
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/supplier_home_screen');
                              },
                              width: 0.25,
                            ),
                            YellowButtonWidget(
                              lable: 'Sign Up',
                              onTap: () {},
                              width: 0.25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        YellowButtonWidget(
                          lable: 'Log In',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/customer_login_screen');
                          },
                          width: 0.25,
                        ),
                        YellowButtonWidget(
                          lable: 'Sign Up',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/customer_signup_screen');
                          },
                          width: 0.25,
                        ),
                        SizedBox(
                          height: 70,
                          child: AnimatedLogoWidget(controller: _controller),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                color: AppColors.grey,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GooglefacebookLoginWidget(
                      lable: 'Google',
                      child: const Image(
                        image: AssetImage('images/inapp/google.jpg'),
                      ),
                      onPressed: () {},
                    ),
                    GooglefacebookLoginWidget(
                      lable: 'Facebook',
                      child: const Image(
                        image: AssetImage('images/inapp/facebook.jpg'),
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signInAnonymously();

                        Navigator.pushReplacementNamed(
                            context, '/customer_screen');
                      },
                    ),
                    GooglefacebookLoginWidget(
                      lable: 'Guest',
                      child: const Icon(
                        Icons.person,
                        size: 55,
                        color: AppColors.lightBlueAccent,
                      ),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signInAnonymously();
                          print("Signed in with temporary account.");
                        } on FirebaseAuthException catch (e) {
                          switch (e.code) {
                            case "operation-not-allowed":
                              print(
                                  "Anonymous auth hasn't been enabled for this project.");
                              break;
                            default:
                              print("Unknown error.");
                          }
                        }
                        Navigator.pushReplacementNamed(
                            context, '/customer_screen');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
