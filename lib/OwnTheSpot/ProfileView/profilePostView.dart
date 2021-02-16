import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/postArguments.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/Post/postTile.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';

class ProfilePostView extends StatefulWidget {
  final PostArguments arguments;

  ProfilePostView(this.arguments);

  @override
  _ProfilePostViewState createState() => _ProfilePostViewState();
}

class _ProfilePostViewState extends State<ProfilePostView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.arguments.post.username)),
      body: PostTile(widget.arguments.post),
    );
  }
}
