import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/fadeAnimation.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  VideoWidget(this.videoPlayerController);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  Widget videoStatusAnimation;

  @override
  void initState() {
    super.initState();

    videoStatusAnimation = Container();

    _controller = widget.videoPlayerController
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = _isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        setState(() {});
        _controller.pause();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _controller.value.initialized ? videoPlayer() : Loading(),
    );
  }

  Widget videoPlayer() => Stack(
        children: [
          video(),
          Align(
            alignment: Alignment.bottomCenter,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
            ),
          ),
          Center(child: videoStatusAnimation),
        ],
      );

  Widget video() => GestureDetector(
        child: VideoPlayer(_controller),
        onTap: () {
          if (!_controller.value.initialized) {
            return;
          }
          if (_controller.value.isPlaying) {
            videoStatusAnimation = FadeAnimation(
              child: const Icon(Icons.pause, size: 100.0),
            );
            _controller.pause();
          } else {
            videoStatusAnimation = FadeAnimation(
              child: const Icon(Icons.play_arrow, size: 100.0),
            );
            _controller.play();
          }
        },
      );
}
