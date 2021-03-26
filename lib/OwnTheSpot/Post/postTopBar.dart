import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';
import 'package:rollbrett_rottweil/firebase/userServiceTest.dart';

class PostTopBar extends StatefulWidget {
  final String uid;

  PostTopBar(this.uid);

  @override
  _PostTopBarState createState() => _PostTopBarState();
}

class _PostTopBarState extends State<PostTopBar> {
  String downloadedImage;
  String username = "";

  void _getUsername() async {
    await UserServiceTest.getUsername(widget.uid).then((value) {
      if (mounted) {
        setState(() {
          username = value;
        });
      }
    });
  }

  void _getImage() async {
    await FireStorageService.getImageFromUID(widget.uid).then((value) {
      if (mounted) {
        setState(() {
          downloadedImage = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getImage();
    _getUsername();
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
              //TODO: navigate to profile AND PASS DATA!
              onPressed: () {
                DefaultTabController.of(context).animateTo(2);
              },
              child: Column(
                children: [
                  Text(
                    username,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height / 35),
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 23, fontWeight: FontWeight.bold),
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
