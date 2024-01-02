import 'package:flutter/material.dart';

class Ash extends StatelessWidget {
  const Ash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Image.asset(
        'assets/images/sprites/ash/down0.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
