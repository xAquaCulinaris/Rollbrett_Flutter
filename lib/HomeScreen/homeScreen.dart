import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/HomeScreen/homeScreenDrawer.dart';
import 'package:rollbrett_rottweil/HomeScreen/homeScreenButtons.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rollbrett Rottweil"),
      ),
      endDrawer: HomeScreenDrawer(),
      body: HomeScreenButtons()
    );
  }
}
