import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/post_list.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';
import 'package:provider/provider.dart';



class OwnTheSpotPostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Post>>.value(
      value: PostService().posts,
      child: PostList(),
    );
  }
}
