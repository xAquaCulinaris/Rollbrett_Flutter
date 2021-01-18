import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final String userID;
  List<String> ratedBy;
  List<int> ratings;

  RatingBar(this.userID, this.ratedBy, this.ratings);

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int userRating = 0;

  void setRating() {
    print("now");
    print(widget.ratedBy.length);
    //print(widget.ratings.length);
    print(widget.ratedBy.length);
      for (int i = 0; i < widget.ratedBy.length; i++) {
        print("UID:" + widget.ratedBy[i]);
        if (widget.ratedBy[i] == widget.userID) {
          //TODO: Fix to dynamic
          userRating = 3;
        }
      }
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
