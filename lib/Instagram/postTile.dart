import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/Class/user.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(post.uid),
          Icon(Icons.add_a_photo),
        ],
      )
    );
  }
}


