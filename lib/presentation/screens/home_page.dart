import 'package:flutter/material.dart';
import 'package:pokemon_game/presentation/characters/ash.dart';
import 'package:pokemon_game/presentation/maps/pallet_town.dart';
import 'package:pokemon_game/presentation/widgets/button.dart';
import 'package:pokemon_game/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = 0;
  double mapY = 0;
  String currentLocation = 'PalletTown';
  void moveUp() {}
  void moveDown() {}
  void moveLeft() {}
  void moveRight() {}
  void pressedA() {}
  void pressedB() {}
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
                Container(alignment: Alignment(0, 0),child: Ash())
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
