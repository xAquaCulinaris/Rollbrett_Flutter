import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/profilePostTile.dart';
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

  //TODO: fetch posts
  List<Post> postss = [];
  final List<String> posts = ["one", "two", "three", "one"];

  @override
  void initState() {
    _getUser(widget.uid);
    _getImage();
    _getPosts(widget.uid);
    super.initState();
  }

  void _getPosts(String uid) async {
    print("test1");
    await PostService.getAllPostFromUser(uid).then((value) {
      print("test2");
      if(mounted)
        print("test3");
        setState(() {
          print("setted");
          postss = value;
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
                Text(user.name),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.width * 0.105,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.1,
                    backgroundImage: profilePicture == null ? null : NetworkImage(profilePicture),
                  ),
                ),
                Expanded(
                  child: postss == null ? Text("no posts") :ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: postss.length.toDouble()/3.0 > posts.length~/3? posts.length~/3+1 : posts.length~/3,
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
            return ProfilePostTile(
                user.name, postss[index].postID);
          }),
    );
  }

  int calculateGrid(int index) {
    int length = posts.length;
    int mod = length % 3;

      if(length.toDouble()~/3.0 == index)
        return mod;

    return 3;
  }

}
