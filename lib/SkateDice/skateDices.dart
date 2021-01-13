import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/Class/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDicePlayerScoreItem.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceText.dart';
import 'package:shake/shake.dart';

class SkateDices extends StatefulWidget {
  List<SkateDicePlayer> players;
  List<SkateDiceObstacles> obstacleList;
  List<SkateDiceTricks> obstacleTricks;

  SkateDices(this.players, this.obstacleList, this.obstacleTricks);

  @override
  _SkateDicesState createState() => _SkateDicesState();
}

class _SkateDicesState extends State<SkateDices> {
  ShakeDetector detector;




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

    int randomObstacle = random.nextInt(widget.obstacleList.length);

    //filter type of tricks that are possible
    List<SkateDiceTricks> trickListfiltered = widget.obstacleTricks
        .where((element) =>
            element.obstacleType == widget.obstacleList[randomObstacle].obstacleType)
        .toList();
    int randomTrick = random.nextInt(trickListfiltered.length);
    int randomStance = random.nextInt(stance.length);

    if (widget.obstacleList[randomObstacle].obstacleType == ObstacleType.Flat) {
      setState(() {
        text1 = enumToString(stance[randomStance].toString());
        text2 = trickListfiltered[randomTrick].name;
        text3 =
            enumToString(widget.obstacleList[randomObstacle].obstacleType.toString());
        text4 = "";
      });
    } else {
      String directionString = "";
      if (widget.obstacleList[randomObstacle].direction != Direction.None) {
        if (widget.obstacleList[randomObstacle].direction == Direction.Frontside) {
          directionString = "Frontside";
        }
        if (widget.obstacleList[randomObstacle].direction == Direction.Backside) {
          directionString = "Backside";
        } else {
          directionString = direction[random.nextInt(direction.length)];
        }
      }

      setState(() {
        text1 = enumToString(stance[randomStance].toString());
        text2 = directionString;
        text3 = trickListfiltered[randomTrick].name;
        text4 = enumToString(widget.obstacleList[randomObstacle].name.toString());
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

  Widget _getPlayerScores() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < widget.players.length; i++) {
      list.add(SkateDicePlayerScoreItem(widget.players[i], false));
    }

    return Column(children: list,);
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

             _getPlayerScores(),
            ],
          ),
        ),
      ),
    );
  }
}
