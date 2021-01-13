import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/CoursePreview/coursePreview.dart';
import 'package:rollbrett_rottweil/Instagram/instagramTabBar.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceAddPlayer.dart';
import 'package:rollbrett_rottweil/fonts/rollbrett__flutter_icons.dart';
import 'package:rollbrett_rottweil/mainMenueButton.dart';

void main() {
  bool loggedIn = false;

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
      accentColor: Colors.grey[900],
    ),
    home: loggedIn ? HomeScreen() : LoginPage(),
  ));
}

class HomeScreen extends StatelessWidget {

  void coursePreviewButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CoursePreview()),
    );
  }

  void skateDicesButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkateDiceAddPlayer()),
    );
  }

  void ownTheSpotButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InstagramTabBar()),
    );
  }

  void creditsButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkateDiceAddPlayer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rollbrett Rottweil"),
          bottom: null, //maybe implement instagramm tabbar
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                MainMenueButton("Course Preview", Rollbrett_Flutter.noun_half_pipe_699586, coursePreviewButton, context),
                SizedBox(width: 20),
                MainMenueButton("Skate Dices", Rollbrett_Flutter.dice, skateDicesButton, context),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                MainMenueButton("Own the Spot", Rollbrett_Flutter.video_camera, ownTheSpotButton, context),
                SizedBox(width: 20),
                MainMenueButton("Credits", Rollbrett_Flutter.skateboard, creditsButton, context),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
    );
  }
}

