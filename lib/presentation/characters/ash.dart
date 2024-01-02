import 'package:flutter/material.dart';

class Ash extends StatelessWidget {
  final int boySpriteCount;
  final String direction;
  final String location;
  double height = 30;
  
   Ash({super.key, required this.boySpriteCount, required this.direction, required this.location});

  @override
  Widget build(BuildContext context) {
    if(location == 'PalletTown'){
      height = 30;
    }else{
      height = 30;
    }
    return Container(
      height: height,
      child: Image.asset(
        'assets/images/sprites/ash/$direction$boySpriteCount.png', 
        fit: BoxFit.cover,
      ),
    );
  }
}
