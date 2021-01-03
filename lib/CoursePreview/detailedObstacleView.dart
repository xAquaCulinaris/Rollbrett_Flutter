import 'package:flutter/material.dart';

import '../Class/obstacle.dart';

class DetailedObstacleView extends StatelessWidget {
  final Obstacle obstacle;

  DetailedObstacleView(this.obstacle);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(obstacle.name),
        ),
        body: Text("test"),
      ),
    );
  }
}
