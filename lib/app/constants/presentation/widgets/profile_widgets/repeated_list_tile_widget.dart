import 'package:flutter/material.dart';

class RepeatedListStyleWidget extends StatelessWidget {
  const RepeatedListStyleWidget({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle!),
      ),
    );
  }
}
