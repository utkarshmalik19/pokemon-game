import 'package:flutter/material.dart';

class OakLab extends StatelessWidget {
  final double x;
  final double y;
  final String currentMap;
  const OakLab({super.key, required this.x, required this.y, required this.currentMap});

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'OakLab') {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          'assets/images/maps/oak lab.png',
          width: MediaQuery.of(context).size.width*0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
