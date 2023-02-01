import 'package:flutter/material.dart';

class CategoryHeaderLable extends StatelessWidget {
  const CategoryHeaderLable({
    Key? key,
    required this.headerLable,
  }) : super(key: key);
  final String headerLable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
        top: 30,
        right: 115,
      ),
      child: Text(
        headerLable,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
