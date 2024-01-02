import 'package:flutter/material.dart';

class PalletTown extends StatelessWidget {
  final double x;
  final double y;
  final String currentMap;
  const PalletTown({super.key, required this.x, required this.y, required this.currentMap});

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'PalletTown') {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          'assets/images/maps/pallet.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
