import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/Post/postTile.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/postArguments.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';

class ProfilePostView extends StatefulWidget {
  final PostArguments arguments;

  ProfilePostView(this.arguments);

  @override
  _ProfilePostViewState createState() => _ProfilePostViewState();
}

class _ProfilePostViewState extends State<ProfilePostView> {
  String username = "";

  void _getUsername(String uid) async {
    await UserService.getUsername(uid).then((value) {
      setState(() {
        username = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getUsername(widget.arguments.post.uid);
    return Scaffold(
      appBar: AppBar(title: Text(username)),
      body: PostTile(widget.arguments.post),
    );
  }
}
