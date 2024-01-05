import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_game/presentation/characters/ash.dart';
import 'package:pokemon_game/presentation/maps/oak_lab.dart';
import 'package:pokemon_game/presentation/maps/pallet_town.dart';
import 'package:pokemon_game/presentation/widgets/button.dart';
import 'package:pokemon_game/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = 1.25;
  double mapY = 0.4;
  double step = 0.2;

  //Prof Oak Lab
  double oakLabX = 0;
  double oakLabY = 0;
  //No man's land for pallet town
  List<List<double>> noMansLandPalletTown = [
    [-0.429, 0.64],
    [1.8499999999999999,0.6000000000000001],
   [1.65,0.6],
   [1.45,0.6],
   [1.25,0.6],
   [1.05,0.6],
   [0.85,0.6],
   [0.65,0.6],

   //[-1.15, -0.4] //Prof Oak lab door
    
  ];
  int boySpriteCount = 0;
  String boyDirection = 'down';
  String currentLocation = 'PalletTown';
  void moveUp() {
    boyDirection = 'up';
    if(currentLocation == 'PalletTown'){
      if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        mapY += step;
      });      
    }
    if(double.parse((mapX).toStringAsFixed(4))== -1.15 && double.parse((mapY).toStringAsFixed(4))== -0.4){
      setState(() {
        currentLocation = 'OakLab';
        oakLabX = 0;
        oakLabY = -2.73;
      });
    }
    animateWalk();
    }else if(currentLocation == 'OakLab'){
      if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        oakLabY += step;
      });      
    }
    animateWalk();
    }
  }

  void moveDown() {
    boyDirection = 'down';
    if(currentLocation == 'PalletTown'){
      if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        mapY -= step;
      });
    }

    animateWalk();
    }else if(currentLocation == 'OakLab'){
      if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        oakLabY -= step;
      });
    }

    animateWalk();
    }
    
  }

  void moveLeft() {
    boyDirection = 'left';
    if(currentLocation == 'PalletTown'){
      if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        mapX += step;
      });
    }

    animateWalk();
    }else if(currentLocation == 'OakLab'){
      setState(() {
        oakLabX += step;
      });
      animateWalk();
    }
  }

  void moveRight() {
    boyDirection = 'right';
   if(currentLocation == 'PalletTown'){
     if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        mapX -= step;
      });
    }

    animateWalk();
   }else if(currentLocation == 'OakLab'){
    if (canMoveTo(boyDirection, noMansLandPalletTown, mapX, mapY)) {
      setState(() {
        oakLabX -= step;
      });
    }

    animateWalk();
   }
  }

  void pressedA() {}
  void pressedB() {}

  void animateWalk() {
    print('x :' + mapX.toString() + ' and y :' + mapY.toString());
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });
      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

double cleanNum(double num){
  return double.parse(num.toStringAsFixed(4));
}
  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;
    if (direction == 'left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'down') {
      stepX = 0;
      stepY = -step;
    }
    for (int i = 0; i < noMansLand.length; i++) {
      if ((cleanNum(noMansLand[i][0]) == cleanNum(x + stepX)) &&
          (cleanNum(noMansLand[i][1]) == cleanNum(y + stepY))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                PalletTown(x: mapX, y: mapY, currentMap: currentLocation),
                OakLab(x: oakLabX, y: oakLabY, currentMap: currentLocation),
                Container(
                    alignment: const Alignment(0, 0),
                    child: Ash(
                      boySpriteCount: boySpriteCount,
                      direction: boyDirection,
                      location: currentLocation,
                    ))
              ],
            ),
          )),
          Expanded(
              child: Container(
            color: Colors.grey.shade800,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pokemon Game",
                    style: AppConstants.headerTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '←',
                                function: moveLeft,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MyButton(
                                text: '↑',
                                function: moveUp,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '↓',
                                function: moveDown,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '→',
                                function: moveRight,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: 'a',
                                function: pressedA,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MyButton(
                                text: 'b',
                                function: pressedB,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    "Made by Me",
                    style: AppConstants.bigTextStyle,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
