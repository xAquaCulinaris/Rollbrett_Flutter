import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/postArguments.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/postTile.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';

class ProfilePostView extends StatefulWidget {
  final PostArguments arguments;

  ProfilePostView(this.arguments);

  @override
  _ProfilePostViewState createState() => _ProfilePostViewState();
}

class _ProfilePostViewState extends State<ProfilePostView> {
  Post post;

  void _getPost(String id) async {
    PostService.getPostFromID(id).then((value) {
      if (mounted) {
        setState(() {
          post = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getPost(widget.arguments.id);
    return Scaffold(
      appBar: AppBar(title: Text(widget.arguments.name)),
      body: post == null ? Loading() : PostTile(post),
    );
  }
}
