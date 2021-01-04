import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'CoursePreview/videoListItem.dart';

class TestingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Texting view"),
          ),
          body: ListView(
              children: <Widget>[
          VideoListItem(
          videoPlayerController:
          VideoPlayerController.asset('videos/270BoardSlide.mp4'),
          looping: true),
      VideoListItem(videoPlayerController: VideoPlayerController.asset(
          'videos/270BoardSlide.mp4'), looping: true),
      ],
    )),
    );
  }
}
