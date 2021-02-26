import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceExpandableCheckBox.dart';

class SkateDiceConfig extends StatefulWidget {
  @override
  _SkateDiceConfigState createState() => _SkateDiceConfigState();
}

class _SkateDiceConfigState extends State<SkateDiceConfig> {
  List<ObstacleType> obstacleTypes = ObstacleType.values;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: obstacleTypes.length,
              itemBuilder: (BuildContext context, int index) =>
                  SkateDiceExpandableCheckBox(index)
          ),
        ],
      );
  }
}