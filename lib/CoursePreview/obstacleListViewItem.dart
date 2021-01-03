import 'package:flutter/material.dart';

import 'detailedObstacleView.dart';
import '../Class/obstacle.dart';

class ObstacleListViewItem extends StatelessWidget {
  final List<Obstacle> obstacleList;
  final int index;
  ObstacleListViewItem(this.obstacleList, this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Card(
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  image: AssetImage(obstacleList[index].image),
                  width: 150,
                  height: 150,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    obstacleList[index].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: <Widget>[
                    Text("Difficulty: " + obstacleList[index].difficulty),
                    Text("Height: " + obstacleList[index].height.toString()),
                    Text("Width: " + obstacleList[index].width.toString()),
                    ElevatedButton(
                        onPressed: obstacleList[index].inRange ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailedObstacleView(Obstacle.getRail()),
                            ),
                          );
                        } : null, // null is the else part to deactivate the button
                        child: obstacleList[index].inRange ? Text("Details") : Text("Out of Range")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}