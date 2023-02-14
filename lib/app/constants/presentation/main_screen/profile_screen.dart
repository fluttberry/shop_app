import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/presentation/customer_screens/customer_order_screen.dart';
import 'package:shop_app/app/constants/presentation/customer_screens/customer_wishlist_screen.dart';
import 'package:shop_app/app/constants/presentation/main_screen/cart_creen.dart';
import 'package:shop_app/app/constants/presentation/widgets/profile_widgets/profile_header_lable_widget.dart';
import 'package:shop_app/app/constants/presentation/widgets/profile_widgets/red_divider_widget.dart';
import 'package:shop_app/app/constants/presentation/widgets/profile_widgets/repeated_list_tile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.yellow,
                  AppColors.orange,
                  AppColors.red,
                ],
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                centerTitle: true,
                backgroundColor: AppColors.white,
                expandedHeight: 120,
                flexibleSpace: LayoutBuilder(builder: (context, constraint) {
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      opacity: constraint.biggest.height <= 120 ? 1 : 0,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      child: const Text(
                        'Account',
                        style: TextStyle(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.yellow,
                            AppColors.orange,
                            AppColors.red,
                          ],
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'images/inapp/guest.jpg',
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'guest'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  25,
                                ),
                                bottomLeft: Radius.circular(
                                  25,
                                ),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CartScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Cart',
                                    style: TextStyle(
                                      color: AppColors.yellow,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: AppColors.yellow,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerOrderScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Orders',
                                    style: TextStyle(
                                      color: AppColors.brown,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  25,
                                ),
                                bottomRight: Radius.circular(
                                  25,
                                ),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomernWishlistSCree(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Wishlist',
                                    style: TextStyle(
                                      color: AppColors.yellow,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColors.grey.shade300,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 150,
                            child: const Image(
                              image: AssetImage('images/inapp/logo.jpg'),
                            ),
                          ),

                          // ignore: prefer_const_constructors
                          ProfileHeaderLableWidget(
                              headerlable: '  Account Info.  '),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const RepeatedListStyleWidget(
                                    icon: Icons.email,
                                    title: 'Email Address',
                                    subtitle: 'email@gmail.com',
                                  ),
                                  const RedDividerWidget(),
                                  const RepeatedListStyleWidget(
                                    icon: Icons.phone,
                                    title: 'Phone No.',
                                    subtitle: '+996 555 555 555',
                                  ),
                                  const RedDividerWidget(),
                                  RepeatedListStyleWidget(
                                    icon: Icons.location_pin,
                                    title: 'Address',
                                    subtitle:
                                        'K.Datka street, Osh city, Kyrgyz Republic',
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const ProfileHeaderLableWidget(
                            headerlable: '  Account Settings  ',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  RepeatedListStyleWidget(
                                    icon: Icons.edit,
                                    title: 'Edit Profile', onPressed: () {},
                                    // subtitle: 'email@gmail.com',
                                  ),
                                  const RedDividerWidget(),
                                  RepeatedListStyleWidget(
                                    icon: Icons.lock,
                                    title: 'Change Password', onPressed: () {},
                                    // subtitle: '+996 555 555 555',
                                  ),
                                  const RedDividerWidget(),
                                  RepeatedListStyleWidget(
                                    icon: Icons.logout,
                                    title: 'Logout',
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.pushReplacementNamed(
                                          context, '/welcome_screen');
                                    },
                                    // subtitle: 'K.Datka street, Osh city, Kyrgyz Republic',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
