import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceAddPlayer.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceConfig.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';

class SkateDiceTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          title: Text('Skate Dice'),
        ),
        body: TabBarView(
          children: [
            SkateDiceAddPlayer(),
            SkateDiceConfig(),
            SkateDices()
          ],
        ),
      ),
    );
  }
}
