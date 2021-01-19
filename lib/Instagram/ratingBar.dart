import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/firebase/ratingService.dart';

class RatingBar extends StatefulWidget {
  final String userID;
  final String postID;

  RatingBar(this.userID, this.postID);

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int userRating = 0;

  void setRating() async {
    int value = await RatingService.getRating(widget.userID, widget.postID);
    setState(() {
      userRating = value;
    });
  }

  @override
  void initState() {
    setRating();
    super.initState();
  }

  Widget ratingTile(int index) {
    return Container(
      padding: EdgeInsets.all(0.0),
      width: MediaQuery.of(context).size.width / 10,
      child: IconButton(
        iconSize: MediaQuery.of(context).size.width / 10,
        icon: Icon(
          index <= userRating - 1 ? Icons.star_sharp : Icons.star_border_sharp,
          color: Colors.black,
        ),
        onPressed: () {
          setState(
            () {
              userRating = index + 1;
              RatingService.setRating(widget.userID, widget.postID, userRating);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ratingTile(index);
      },
    );
  }
}
