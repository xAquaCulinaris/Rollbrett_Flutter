import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/video_widget.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rollbrett_rottweil/fonts/rollbrett__flutter_icons.dart';
import 'package:video_player/video_player.dart';

class OwnTheSpotNewPostView extends StatefulWidget {
  @override
  _OwnTheSpotNewPostViewState createState() => _OwnTheSpotNewPostViewState();
}


class _OwnTheSpotNewPostViewState extends State<OwnTheSpotNewPostView> {
  File video;

  void addPost() {
    PostService.updatePostData();
  }


  Future getVideo() async {
    final media = await ImagePicker().getVideo(source: ImageSource.gallery);
    final file = File(media.path);
    if (file != null) {
      setState(() {
        video = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        video == null ? Icon(Rollbrett_Flutter.video_camera) : VideoWidget(VideoPlayerController.file(video)),
        RoundedButton("Select Video", getVideo, 40, 20),
        RoundedButton("New Post", addPost, 40, 20),
      ],
    );
  }
}
