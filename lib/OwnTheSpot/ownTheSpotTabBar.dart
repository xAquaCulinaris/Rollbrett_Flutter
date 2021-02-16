import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ownTheSpotView.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ownTheSpotNewPostView.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';

import 'ProfileView/ownTheSpotProfileView.dart';

class OwnTheSpotTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.alt_route)),
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
            title: Text('Rollbrett Rottweil'),
          ),
          body: TabBarView(
            children: [
              OwnTheSpotPostView(),
              OwnTheSpotNewPostView(),
              OwnTheSpotProfileView(AuthService.userID),
            ],
          ),
      ),
    );
  }

}