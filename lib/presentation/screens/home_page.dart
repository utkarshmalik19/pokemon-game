import 'package:flutter/material.dart';
import 'package:pokemon_game/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.green,
          )),
          Expanded(
              child: Container(
            color: Colors.grey.shade900,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pokemon Game", style: AppConstants.headerTextStyle,),
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Text("Made by Me", style: AppConstants.bigTextStyle,)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
