import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/Instagram/ratingBar.dart';

class PostBottomBar extends StatefulWidget {
  final String userID;

  PostBottomBar(this.userID);

  @override
  _PostBottomBarState createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/20,
      width: MediaQuery.of(context).size.width,

      //TODO:: Fix scrolldirection to horizontal and add logik for rating
      child: RatingBar(widget.userID),
    );
  }
}
