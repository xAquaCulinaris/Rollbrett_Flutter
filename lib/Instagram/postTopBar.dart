import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';

class PostTopBar extends StatefulWidget {
  final String username;
  final String uid;

  PostTopBar(this.username, this.uid);

  @override
  _PostTopBarState createState() => _PostTopBarState();
}

class _PostTopBarState extends State<PostTopBar> {
  String downloadedImage;


  //TODO:: fix memory leak!!
  void _getImage() async {
      await FireStorageService.getImageFromUID(widget.uid).then((value) {
        setState(() {
          downloadedImage = value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    _getImage();
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
                backgroundImage: downloadedImage == null ? null : NetworkImage(downloadedImage),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: [
                  Text(
                    widget.username,
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
