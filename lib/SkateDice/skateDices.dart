import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceModelController.dart';
import 'package:rollbrett_rottweil/SkateDice/addPlayer.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDicePlayerScoreItem.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceText.dart';
import 'package:shake/shake.dart';

class SkateDices extends StatefulWidget {
  @override
  _SkateDicesState createState() => _SkateDicesState();
}

class _SkateDicesState extends State<SkateDices> {
  ShakeDetector detector;

  List<SkateDicePlayer> players = [];
  List<SkateDiceObstacles> obstacleList = [];
  List<SkateDiceTricks> obstacleTricks = [];

  List<String> direction = ["Frontside", "Backside"];

  List<Stance> stance = [
    Stance.Regular,
    Stance.Switch,
    Stance.Fakie,
    Stance.Nollie
  ];

  List<Map<String, String>> currentTrick = List<Map<String, String>>();

  String enumToString(String text) {
    return text.split('.').last;
  }

  void _rollDices() {
    Random random = new Random();

    int randomObstacle = random.nextInt(obstacleList.length);

    //filter type of tricks that are possible
    List<SkateDiceTricks> trickListfiltered = obstacleTricks
        .where((element) =>
            element.obstacleType == obstacleList[randomObstacle].obstacleType)
        .toList();
    int randomTrick = random.nextInt(trickListfiltered.length);
    int randomStance = random.nextInt(stance.length);

    if (obstacleList[randomObstacle].obstacleType == ObstacleType.Flat) {
      setState(() {
        currentTrick[0] = {
          'name': enumToString(stance[randomStance].toString()),
          'picture': 'null'
        };
        currentTrick[1] = {
          'name': trickListfiltered[randomTrick].name,
          'picture': 'null'
        };
        currentTrick[2] = {
          'name': enumToString(
              obstacleList[randomObstacle].obstacleType.toString()),
          'picture': obstacleList[randomObstacle].picture
        };
        currentTrick[3] = {'name': '', 'picture': 'null'};
      });
    } else {
      String directionString = "";
      if (obstacleList[randomObstacle].direction != Direction.None) {
        if (obstacleList[randomObstacle].direction == Direction.Frontside) {
          directionString = "Frontside";
        }
        if (obstacleList[randomObstacle].direction == Direction.Backside) {
          directionString = "Backside";
        } else {
          directionString = direction[random.nextInt(direction.length)];
        }
      }

      setState(() {
        currentTrick[0] = {
          'name': enumToString(stance[randomStance].toString()),
          'picture': 'null'
        };
        currentTrick[1] = {'name': directionString, 'picture': 'null'};
        currentTrick[2] = {
          'name': trickListfiltered[randomTrick].name,
          'picture': 'null'
        };
        currentTrick[3] = {
          'name': enumToString(obstacleList[randomObstacle].name.toString()),
          'picture': obstacleList[randomObstacle].picture
        };
      });
    }
  }

  void _addPlayer(String name) {
    if (name == "" || name == null) {
      print("name cant be empty");
    } else {
      setState(() {
        players.add(SkateDicePlayer(name));
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

    //for (int i = 0; i < widget.players.length; i++) {
    for (int i = 0;
        i < players.length;
        i++) {
      list.add(SkateDicePlayerScoreItem(
          players[i], false));
    }

    return Column(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO CALL SOMEWHERE ELSE (not efficient)
    _getConfiguredTricks();
    return Center(
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
            AddPlayer(_addPlayer),
            _getPlayerScores(),
          ],
        ),
      ),
    );
  }

  void _getConfiguredTricks() {
    print("loading config");
    List<SkateDiceTricks> allTricks = SkateDiceTricks.getTricks();
    List<SkateDiceObstacles> allObstacle = SkateDiceObstacles.getObstacles();

    obstacleList.clear();
    obstacleTricks.clear();

    for (int x = 0;
        x < SkateDiceModelController.of(context).skateDiceMap.length;
        x++) {
      //TODO when no is selected disable checkbox
      //need to look if at least one children ist checked
      if (SkateDiceModelController.of(context).skateDiceMap[x]['isChecked'] ==
          true) {
        //loop trough all tricks and add them
        for (int z = 0; z < allTricks.length; z++) {
          var test1 = SkateDiceModelController.of(context).skateDiceMap[x]
              ['obstacleType'];
          var test2 = allTricks[z].obstacleType.toString();

          if (test1 == test2) {
            obstacleTricks.add(allTricks[z]);
          }
        }

        //loop through all obstacles and add them if 'isChecked' is true
        for (int y = 0;
            y <
                SkateDiceModelController.of(context).skateDiceMap[x]
                    ['itemCount'];
            y++) {
          if (SkateDiceModelController.of(context).skateDiceMap[x]['obstacles']
              [y]['isChecked']) {
            for (SkateDiceObstacles toAdd in allObstacle) {
              if (toAdd.name ==
                  SkateDiceModelController.of(context).skateDiceMap[x]
                      ['obstacles'][y]['obstacleName']) {
                obstacleList.add(toAdd);
              }
            }
          }
        }
      }
    }
  }
}
