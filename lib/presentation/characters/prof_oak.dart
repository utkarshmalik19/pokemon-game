import 'package:flutter/material.dart';

class ProfOak extends StatelessWidget {
  final double x;
  final double y;
  final String oakDirection;
  final String location;
  const ProfOak(
      {required this.x,
      required this.y,
      required this.location,
      required this.oakDirection,
      super.key});

  @override
  Widget build(BuildContext context) {
    if(location == 'PalletTown'){
      return Container(
        height: 40,
      //alignment: Alignment(x, y),
      child: Image.asset('assets/images/sprites/oak.png', fit: BoxFit.cover,),
    );
    }else{
      return Container();
    }
    
  }
}
