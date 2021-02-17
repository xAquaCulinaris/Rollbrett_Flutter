import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/fonts/rollbrett__flutter_icons.dart';

import 'homeScreenButton.dart';

class HomeScreenButtons extends StatelessWidget {
  void coursePreviewButton(BuildContext context) {
    Navigator.of(context).pushNamed('/course_preview');
  }

  void skateDicesButton(BuildContext context) {
    Navigator.of(context).pushNamed('/skate_dice');
  }

  void ownTheSpotButton(BuildContext context) {
    Navigator.of(context).pushNamed('/own_the_spot');
  }

  void creditsButton(BuildContext context) {
    Navigator.of(context).pushNamed('/a');
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            HomeScreenButton(
                "Course Preview",
                Rollbrett_Flutter.noun_half_pipe_699586,
                coursePreviewButton,
                context),
            SizedBox(width: 20),
            HomeScreenButton("Skate Dices", Rollbrett_Flutter.dice,
                skateDicesButton, context),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            HomeScreenButton("Own the Spot", Rollbrett_Flutter.video_camera,
                ownTheSpotButton, context),
            SizedBox(width: 20),
            HomeScreenButton("Credits", Rollbrett_Flutter.skateboard,
                creditsButton, context),
            SizedBox(width: 20),
          ],
        )
      ],
    );
  }
}
