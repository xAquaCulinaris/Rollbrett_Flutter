import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/video_widget.dart';
import 'package:video_player/video_player.dart';

import '../Class/obstacle.dart';

class DetailedObstacleView extends StatelessWidget {
  final Obstacle obstacle;

  DetailedObstacleView(this.obstacle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(obstacle.name),
      ),
      body: ListView(
        children: [
          Image(image: AssetImage(obstacle.image)),
          Text("Type of Tricks: Grinds and Slides", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Text("Difficulty: " + obstacle.difficulty, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Heigth: " + obstacle.height.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Height: " + obstacle.width.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          VideoWidget(VideoPlayerController.asset('videos/270BoardSlide.mp4')),
          SizedBox(height: 20),
          VideoWidget(VideoPlayerController.asset('videos/fsFlip_ParkDC.mp4')),
        ],
      ),
    );
  }
}
