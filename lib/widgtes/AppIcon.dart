import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image.asset(
        'assets/images/logo.jpg',
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
