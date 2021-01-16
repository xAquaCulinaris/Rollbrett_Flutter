import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/Instagram/post_list.dart';
import 'package:rollbrett_rottweil/firebase/databasePosts.dart';
import 'package:provider/provider.dart';



class InstagramClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Post>>.value(
      value: DatabaseServicePosts().users,
      child: PostList(),
    );
  }
}
