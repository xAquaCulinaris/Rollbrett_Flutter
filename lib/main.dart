import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/CoursePreview/coursePreview.dart';
import 'package:rollbrett_rottweil/Instagram/instagramTabBar.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';

void main() {
  bool loggedIn = false;

  runApp(MaterialApp(
    home: loggedIn ? _HomeScreen() : LoginPage(),
  ));
}

class _HomeScreen extends StatelessWidget {
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
                Expanded(
                  child: RaisedButton(
                    child: Text("Course preview"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoursePreview()));
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: RaisedButton(
                    child: Text("Skate Dices"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SkateDices()));
                    },
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: RaisedButton(
                    child: Text("Own the Spot"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InstagramTabBar()));
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: RaisedButton(
                    child: Text("Comming soon!"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 20),
              ],
            )
          ],
        ),
    );
  }
}
