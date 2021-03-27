import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/Post/ratingBar.dart';

class PostBottomBar extends StatefulWidget {
  final String userID;
  final String postID;
  final String caption;

  PostBottomBar(this.userID, this.postID, this.caption);

  @override
  _PostBottomBarState createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.width,
          child: RatingBar(widget.userID, widget.postID),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(widget.caption == null ? "" : widget.caption, textScaleFactor: 1.3,),
        )

      ],
    );
  }
}
