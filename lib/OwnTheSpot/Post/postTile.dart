import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/Post/postBottomBar.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/Post/postTopBar.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/video_widget.dart';
import 'package:video_player/video_player.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        PostTopBar(post.uid),
        // VideoWidget(VideoPlayerController.network(post.video)),
        VideoWidget(VideoPlayerController.asset('videos/270BoardSlide.mp4')),
        PostBottomBar(post.uid, post.postID),
      ],
    ));
  }
}
