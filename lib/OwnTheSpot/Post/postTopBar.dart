import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/Post/postMenu.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customMessageBox.dart';
import 'package:rollbrett_rottweil/emailSender.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';
import 'package:rollbrett_rottweil/firebase/postService.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';

class PostTopBar extends StatefulWidget {
  final String uid;
  final String postID;

  PostTopBar(this.postID, this.uid);

  @override
  _PostTopBarState createState() => _PostTopBarState();
}

class _PostTopBarState extends State<PostTopBar> {
  String downloadedImage;
  String username = "";

  void _getUsername() async {
    await UserService.getUsername(widget.uid).then((value) {
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
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                if (widget.uid == AuthService.userID) {
                  return OwnPostOptions.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                } else {
                  return OtherOptions.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    switch (choice) {
      case OwnPostOptions.edit:
        print(OwnPostOptions.edit);
        break;

      case OwnPostOptions.delete:
        PostService.deletePost(widget.postID);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomMessageBox(
                "Success",
                "Successfully deleted your post",
                "Okay",
              );
            });
        break;

      //TODO EMAIL INFORMATION

      case OtherOptions.reportPost:
        sendReport(Email_subject.bad_content);
        break;

      case OtherOptions.reportScooter:
        sendReport(Email_subject.scooter_content);
        break;
    }
  }

  void sendReport(Email_subject subject) async {
    String currentUid = AuthService.userID;
    String currentUser = await UserService.getUsername(currentUid);
    String userToReport = await UserService.getUsername(widget.uid);

    EmailSender.send_mail(subject, "test", currentUser, currentUid, userToReport, widget.uid);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomMessageBox(
            "Report sent",
            "Thanks you for helping out! :)",
            "Okay",
          );
        });


  }
}
