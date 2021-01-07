import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/CoursePreview/coursePreview.dart';
import 'package:rollbrett_rottweil/Instagram/instagramTabBar.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceAddPlayer.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';

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
      MaterialPageRoute(builder: (context) => SkateDices()),
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
                RoundedButton("Course Preview", () => coursePreviewButton(context), 53, 24),
                SizedBox(width: 20),
                RoundedButton("Skate Dices", () => skateDicesButton(context), 53, 24),
                SizedBox(width: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                RoundedButton("Own the Spot", () => ownTheSpotButton(context), 53, 24),
                SizedBox(width: 20),
                RoundedButton("Credits", () => creditsButton(context), 53, 24),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
    );
  }
}
