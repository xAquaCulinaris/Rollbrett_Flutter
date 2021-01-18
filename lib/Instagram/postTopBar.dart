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
              backgroundColor: Colors.black,
              radius: MediaQuery.of(context).size.width * 0.07,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.065,
                backgroundImage: NetworkImage(image),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: [
                  Text(
                    username,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: MediaQuery.of(context).size.width / 25,
                        ),
                        Text(
                          "The Hubaa",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
