import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Instagram/instagramCloneView.dart';
import 'package:rollbrett_rottweil/Instagram/instagramNewPostView.dart';

class InstagramTabBar extends StatelessWidget {
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
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.camera)),
              ],
            ),
            title: Text('Rollbrett Rottweil'),
          ),
          body: TabBarView(
            children: [
              InstagramClone(),
              InstagramNewPostView(),
              InstagramNewPostView(),
            ],
          ),
      ),
    );
  }

}