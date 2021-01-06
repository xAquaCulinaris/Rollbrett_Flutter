import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';

class SkateDices extends StatefulWidget {
  @override
  _SkateDicesState createState() => _SkateDicesState();
}

class _SkateDicesState extends State<SkateDices> {
  List<SkateDiceObstacles> obstacleList = SkateDiceObstacles.getObstacles();
  List<SkateDiceTricks> obstacleTricks = SkateDiceTricks.getTricks();
  List<String> direction = ["Frontside", "Backside"];
  List<Stance> stance = [
    Stance.Regular,
    Stance.Switch,
    Stance.Fakie,
    Stance.Nollie
  ];

  String text1 = "";
  String text2 = "";
  String text3 = "";
  String text4 = "";

  void _rollDices() {
    Random random = new Random();

    int randomObstacle = random.nextInt(obstacleList.length);
    List<SkateDiceTricks> trickListfiltered = obstacleTricks
        .where((element) =>
            element.obstacleType == obstacleList[randomObstacle].obstacleType)
        .toList();
    int randomTrick = random.nextInt(trickListfiltered.length);
    int randomStance = random.nextInt(stance.length);


    if (obstacleList[randomObstacle].obstacleType == ObstacleType.Flat ||
        obstacleList[randomObstacle].obstacleType == ObstacleType.ManualPad) {
      setState(() {
        text1 = stance[randomStance].toString();
        text2 = trickListfiltered[randomTrick].name;
        text3 = obstacleList[randomObstacle].obstacleType.toString();
        text4 = "";
      });
    }

    else {
      String direction = "";
      if (obstacleList[randomObstacle].direction != Direction.None) {
        if (obstacleList[randomObstacle].direction == Direction.Frontside) {
          direction = "Frontside";
        }
        if (obstacleList[randomObstacle].direction == Direction.Backside) {
          direction = "Backside";
        } else {
          //direction = direction[random.nextInt(2)];
          direction = "FS";
        }
      }

      setState(() {
        text1 = stance[randomStance].toString();
        text2 = direction;
        text3 = trickListfiltered[randomTrick].name;
        text4 = obstacleList[randomObstacle].name.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Skate Dices"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text("test"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text1),
                    SizedBox(width: 20),
                    Text(text2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text3),
                    SizedBox(width: 20),
                    Text(text4),
                  ],
                ),
                SizedBox(width: 100),
                RoundedButton("Roll Dices", _rollDices, 40, 20),
              ],
            ),
          ),
        ));
  }
}
