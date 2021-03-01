import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceConfig.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';
import 'package:rollbrett_rottweil/fonts/rollbrett__flutter_icons.dart';

class SkateDiceTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Rollbrett_Flutter.noun_half_pipe_699586)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          title: Text('Skate Dice'),
        ),
        body: TabBarView(
          children: [
            SkateDiceConfig(),
            SkateDices()
          ],
        ),
      ),
    );
  }
}
