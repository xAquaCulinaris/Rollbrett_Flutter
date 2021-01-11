import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceExpandableCheckBox.dart';

class SkateDiceConfig extends StatefulWidget {
  final List<SkateDicePlayer> players;

  SkateDiceConfig(this.players);

  @override
  _SkateDiceConfigState createState() => _SkateDiceConfigState();
}

class _SkateDiceConfigState extends State<SkateDiceConfig> {
  List<ObstacleType> obstacleTypes = ObstacleType.values;
  List<SkateDiceObstacles> allObstacles = SkateDiceObstacles.getObstacles();

  var obstacleMap = <Map>[];


  // List<bool> expandedStates = List.filled(ObstacleType.values.length, false);

  @override
  void initState() {
    super.initState();
    print("init");

    for (int i = 0; i < obstacleTypes.length; i++) {
      var map = {};


      var obstacleList = [];
      for (int j = 0; j < allObstacles.length; j++) {
        var obstaclesMap = {};

        if (obstacleTypes[i] == allObstacles[j].obstacleType) {
          obstaclesMap['obstacleName'] = allObstacles[j].name;
          obstaclesMap['isChecked'] = true;
          obstacleList.add(obstaclesMap);
        }
      }

      map['obstacleType'] = obstacleTypes[i].toString();
      map['isExpanded'] = true;
      map['isChecked'] = true;
      map['obstacles'] = obstacleList;
      map['itemCount'] = obstacleList.length;

      obstacleMap.add(map);
    }


    print(obstacleMap);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Skate Dice Configuration"),
        ),
        body: Column(
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: obstacleTypes.length,
                itemBuilder: (BuildContext context, int index) =>
                //_dropDownList(obstacleTypes[index], index),
                SkateDiceExpandableCheckBox(obstacleMap, index)
            ),
            FloatingActionButton(onPressed: _startGame),
          ],
        ),
      ),
    );
  }


  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkateDices(widget.players)),
    );
  }
}

