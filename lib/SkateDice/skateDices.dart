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

  List<Map<String,String>> currentTrick =List<Map<String, String>>();


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
        currentTrick[0] = {'name': enumToString(stance[randomStance].toString()), 'picture': 'null'};
        currentTrick[1] = {'name': trickListfiltered[randomTrick].name, 'picture': 'null'};
        currentTrick[2] = {'name': enumToString(widget.obstacleList[randomObstacle].obstacleType.toString()), 'picture': widget.obstacleList[randomObstacle].picture};
        currentTrick[3] = {'name': '', 'picture': 'null'};
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
        currentTrick[0] = {'name': enumToString(stance[randomStance].toString()), 'picture': 'null'};
        currentTrick[1] = {'name': directionString, 'picture': 'null'};
        currentTrick[2] = {'name': trickListfiltered[randomTrick].name, 'picture': 'null'};
        currentTrick[3] = {'name': enumToString(widget.obstacleList[randomObstacle].name.toString()), 'picture': widget.obstacleList[randomObstacle].picture};
      });
    }
  }

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      _rollDices();
    });

    currentTrick.add({'name': '', 'picture': 'null'});
    currentTrick.add({'name': '', 'picture': 'null'});
    currentTrick.add({'name': '', 'picture': 'null'});
    currentTrick.add({'name': '', 'picture': 'null'});

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
                  // SkateDiceText(text1),
                  SkateDiceText(currentTrick[0]),
                  SizedBox(width: 10),
                  //SkateDiceText(text2),
                  SkateDiceText(currentTrick[1]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SkateDiceText(text3),
                  SkateDiceText(currentTrick[2]),
                  SizedBox(width: 10),
                  // SkateDiceText(text4),
                  SkateDiceText(currentTrick[3]),
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
