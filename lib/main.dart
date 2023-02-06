import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/presentation/auth/customer_register_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/customer_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/dashboard_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/supplier_home_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/welcome_screen.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      // home: const CustomerScreen(),
      // initialRoute: '/customer_screen',
      initialRoute: '/customer_register',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_screen': (context) => const CustomerScreen(),
        '/supplier_home_screen': (context) => const SupplierHomeScreen(),
        '/customer_register': (context) => const CustomerRegisterScreen(),
        '/dashboard_screen': (context) => const DashboardScreen(),
      },
    );
  }
}
