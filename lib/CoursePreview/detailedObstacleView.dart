import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/CoursePreview/videoListItem.dart';
import 'package:video_player/video_player.dart';
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
        body: ListView(
          children: [
            Image(image: AssetImage(obstacle.image)),
            Text("Type of Tricks: Grinds and Slides", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Text("Difficulty: " + obstacle.difficulty, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("Heigth: " + obstacle.height.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("Height: " + obstacle.width.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

            VideoListItem(videoPlayerController: VideoPlayerController.asset('videos/270BoardSlide.mp4'), looping: true),
            VideoListItem(videoPlayerController: VideoPlayerController.asset('videos/fsFlip_ParkDC.mp4'), looping: true),
          ],
        ),
      ),
    );
  }
}
