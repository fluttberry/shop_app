import 'package:flutter/cupertino.dart';

class AppDecartion {
  // ignore: prefer_const_constructors
  static const Decoration welcomeDecoration = BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        'images/inapp/bgimage.jpg',
      ),
    ),
  );
}
