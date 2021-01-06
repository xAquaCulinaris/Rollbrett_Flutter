import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceText.dart';
import 'package:shake/shake.dart';

class SkateDices extends StatefulWidget {
  @override
  _SkateDicesState createState() => _SkateDicesState();
}

class _SkateDicesState extends State<SkateDices> {
  ShakeDetector detector;

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


  String enumToString(String text) {
    return text.split('.').last;
  }



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
        text1 = enumToString(stance[randomStance].toString());
        text2 = trickListfiltered[randomTrick].name;
        text3 = enumToString(obstacleList[randomObstacle].obstacleType.toString());
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
        text1 = enumToString(stance[randomStance].toString());
        text2 = direction;
        text3 = trickListfiltered[randomTrick].name;
        text4 = enumToString(obstacleList[randomObstacle].name.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      _rollDices();
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
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
                   SkateDiceText(text1),
                    SizedBox(width: 10),
                    SkateDiceText(text2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkateDiceText(text3),
                    SizedBox(width: 10),
                    SkateDiceText(text4),
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
