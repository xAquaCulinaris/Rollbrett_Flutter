import 'package:flutter/material.dart';

import 'detailedObstacleView.dart';
import '../Class/obstacle.dart';

class ObstacleListViewItem extends StatefulWidget {
  final List<Obstacle> obstacleList;
  final int index;

  ObstacleListViewItem(this.obstacleList, this.index);

  @override
  _ObstacleListViewItemState createState() => _ObstacleListViewItemState();
}

class _ObstacleListViewItemState extends State<ObstacleListViewItem> {
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
                  image: AssetImage(widget.obstacleList[widget.index].image),
                  width: 150,
                  height: 150,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    widget.obstacleList[widget.index].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: <Widget>[
                    Text("Difficulty: " +
                        widget.obstacleList[widget.index].difficulty),
                    Text("Height: " +
                        widget.obstacleList[widget.index].height.toString()),
                    Text("Width: " +
                        widget.obstacleList[widget.index].width.toString()),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        onPrimary: Colors.white,
                      ),
                      onPressed: widget.obstacleList[widget.index].inRange
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailedObstacleView(
                                      widget.obstacleList[widget.index]),
                                ),
                              );
                            }
                          : null,
                      // null is the else part to deactivate the button
                      child: widget.obstacleList[widget.index].inRange
                          ? Text("Details")
                          : Text("Out of Range"),
                    ),
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
