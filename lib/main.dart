import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/presentation/auth/customer_sign_up.dart';
import 'package:shop_app/app/constants/presentation/main_screen/customer_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/dashboard_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/supplier_home_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_screen': (context) => const CustomerScreen(),
        '/supplier_home_screen': (context) => const SupplierHomeScreen(),
        '/customer_register': (context) => const CustomerSignUp(),
        '/dashboard_screen': (context) => const DashboardScreen(),
      },
    );
  }
}
