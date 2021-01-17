import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/post.dart';

class PostBottomBar extends StatefulWidget {
  @override
  _PostBottomBarState createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
       // scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return IconButton(
            iconSize: MediaQuery.of(context).size.width * 0.04,
            icon: Icon(
              index <= score - 1 ? Icons.star_sharp : Icons.star_border_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                score = index+1;
              });
            },
          );
        },
      ),
    );
  }
}
