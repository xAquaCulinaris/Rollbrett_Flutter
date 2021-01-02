import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/detailedView.dart';
import 'package:rollbrett_rottweil/obstacle.dart';

class CoursePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListDisplay();
  }
}

class ListDisplay extends StatelessWidget {
  final List<Obstacle> obstacles = Obstacle.getObstacles();

  //ListView Item
  Widget buildObstacleItem(BuildContext context, int index) {
    return new Container(
      child: Card(
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  image: AssetImage(obstacles[index].image),
                  width: 150,
                  height: 150,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    obstacles[index].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: <Widget>[
                    Text("Difficulty: " + obstacles[index].difficulty),
                    Text("Height: " + obstacles[index].height.toString()),
                    Text("Width: " + obstacles[index].width.toString()),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedView(),
                            ),
                          );
                        },
                        child: Text("Details")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: obstacles.length,
        itemBuilder: (BuildContext context, int index) =>
            buildObstacleItem(context, index));
  }
}
