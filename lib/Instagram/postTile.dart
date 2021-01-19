import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/CoursePreview/videoListItem.dart';
import 'package:rollbrett_rottweil/Instagram/postBottomBar.dart';
import 'package:rollbrett_rottweil/Instagram/postTopBar.dart';
import 'package:video_player/video_player.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PostTopBar(post.image, post.username, "uid"),
          VideoListItem(videoPlayerController: /*VideoPlayerController.network(post.video)*/ VideoPlayerController.asset('videos/270BoardSlide.mp4'), looping: true),
          PostBottomBar(post.uid),
        ],
      )
    );
  }
}


