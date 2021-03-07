import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/post_list.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';

class OwnTheSpotPostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Post>>.value(
      value: PostService().posts,
      child: PostList(),
    );
  }
}
