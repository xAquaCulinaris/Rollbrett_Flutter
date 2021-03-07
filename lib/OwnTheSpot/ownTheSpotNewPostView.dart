import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/video_widget.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';
import 'package:rollbrett_rottweil/fonts/rollbrett__flutter_icons.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class OwnTheSpotNewPostView extends StatefulWidget {
  @override
  _OwnTheSpotNewPostViewState createState() => _OwnTheSpotNewPostViewState();
}

class _OwnTheSpotNewPostViewState extends State<OwnTheSpotNewPostView> {
  File video;

  Future<String> createThumbnail() async {
    final path = await VideoThumbnail.thumbnailFile(
        video: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", thumbnailPath: (await getTemporaryDirectory()).path, imageFormat: ImageFormat.JPEG);
    return path;
  }

  void addPost() async {
    String path = await createThumbnail();
    File file = File(path);
    String url = await PostService.uploadThumbnail(file);
    PostService.updatePostData(url);
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
