import 'package:flutter/material.dart';

class PostTopBar extends StatelessWidget {
  final String image;
  final String username;
  final String uid;

  PostTopBar(this.image, this.username, this.uid);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.06,
              backgroundImage: NetworkImage(image),
            ),
            Spacer(),
            Text(
              username,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
