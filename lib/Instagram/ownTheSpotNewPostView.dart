import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';

class OwnTheSpotNewPostView extends StatelessWidget {
  void addPost() {
    PostService.updatePostData();
  }


  @override
  Widget build(BuildContext context) {
    return RoundedButton("New Post", addPost, 40, 20);
  }
}