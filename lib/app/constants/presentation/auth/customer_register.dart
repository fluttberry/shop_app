import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

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
                      icon: const Icon(Icons.camera_alt),
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
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        log('pick image from gallery');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              hintText: 'Enter your full name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.deepOrangeAccent,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              hintText: 'Enter your full name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.deepOrangeAccent,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              hintText: 'Enter your full name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.deepOrangeAccent,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: AppColors.deepPurpleAccent,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
