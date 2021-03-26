import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/profilePicture.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/profilePostTile.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';
import 'package:rollbrett_rottweil/firebase/userServiceTest.dart';

class OwnTheSpotProfileView extends StatefulWidget {
  final String uid;

  OwnTheSpotProfileView(this.uid);

  @override
  _OwnTheSpotProfileViewState createState() => _OwnTheSpotProfileViewState();
}

class _OwnTheSpotProfileViewState extends State<OwnTheSpotProfileView> {
  User user;
  String profilePicture;

  List<Post> posts = [];

  @override
  void initState() {
    _getUser(widget.uid);
    _getImage();
    _getPosts(widget.uid);
    super.initState();
  }

  void _getPosts(String uid) async {
    await PostService.getAllPostFromUser(uid).then((value) {
      if (mounted)
        setState(() {
          posts = value;
        });
    });
  }

  void _getUser(String uid) async {
    await UserServiceTest.getUser(uid).then((value) {
      if (mounted)
        setState(() {
          user = value;
        });
    });
  }

  void _getImage() async {
    print("uid: " + widget.uid);
    await FireStorageService.getImageFromUID(widget.uid).then((value) {
      if (mounted) {
        setState(() {
          profilePicture = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return Container(
        child: Column(
          children: [
            ProfilePicture(profilePicture),
            Text(user.name),
            Text(user.stance),
            Expanded(
              child: posts == null
                  ? Text("no posts")
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: posts.length.toDouble() / 3.0 > posts.length ~/ 3 ? posts.length ~/ 3 + 1 : posts.length ~/ 3,
                      itemBuilder: (context, index) {
                        return _horizontalListView(index);
                      }),
            ),
          ],
        ),
      );
    } else {
      return Loading();
    }
  }

  Widget _horizontalListView(int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 3,
      width: MediaQuery.of(context).size.width / 3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: calculateGrid(index),
          itemBuilder: (_, horizontalIndex) {
            print("index: " + horizontalIndex.toString());
            return ProfilePostTile(posts[horizontalIndex]);
          }),
    );
  }

  int calculateGrid(int index) {
    int length = posts.length;
    int mod = length % 3;

    if (length.toDouble() ~/ 3.0 == index) return mod;

    return 3;
  }
}
