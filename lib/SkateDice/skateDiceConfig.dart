import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';

class SkateDiceConfig extends StatefulWidget {
  final List<SkateDicePlayer> players;

  SkateDiceConfig(this.players);

  @override
  _SkateDiceConfigState createState() => _SkateDiceConfigState();
}

class _SkateDiceConfigState extends State<SkateDiceConfig> {
  List<ObstacleType> obstacleTypes = ObstacleType.values;
  List<bool> expandedStates = List.filled(ObstacleType.values.length, false);

  List<SkateDiceObstacles> allObstacles = SkateDiceObstacles.getObstacles();


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
                  _dropDownList(obstacleTypes[index], index),
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


  Widget _checkBoxItem(ObstacleType obstacleType) {
    bool isChecked = false;
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < allObstacles.length; i++) {
      if (allObstacles[i].obstacleType == obstacleType) {
        list.add(CheckboxListTile(
            title: Text(allObstacles[i].name),
            value: isChecked,
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue;
              });
            }));
      }
    }

    return new Column(children: list);
  }

  Widget _dropDownList(ObstacleType obstacleType, int index) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                    !expandedStates[index] ? Icons.arrow_right : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    expandedStates[index] = !expandedStates[index];
                  });
                }),
            Text(obstacleType.toString())
          ],
        ),
        expandedStates[index] ? _checkBoxItem(obstacleType) : Text(""),
      ],
    );
  }
}
