import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/main_screen/cart_creen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/category_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/home_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/profile_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/store_screen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const HomeSareen(),
    const CategoryScreen(),
    const StoreScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {});
          _selectedIndex = index;
        },
      ),
    );
  }
}
