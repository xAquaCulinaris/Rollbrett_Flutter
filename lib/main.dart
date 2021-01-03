import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/CoursePreview/coursePreview.dart';
import 'package:rollbrett_rottweil/Instagram/instagramClone.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';

void main() {
  runApp(_TabBar());
}

class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.alt_route)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.camera)),
              ],
            ),
            title: Text('Rollbrett Rottweil'),
          ),
          body: TabBarView(
            children: [
              CoursePreview(),
              SkateDices(),
              InstagramClone(),
            ],
          ),
        ),
      ),
    );
  }
}