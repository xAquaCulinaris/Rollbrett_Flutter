import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  final String profilePicture;

  ProfilePicture(this.profilePicture);

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: MediaQuery.of(context).size.width * 0.105,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.1,
        backgroundImage: widget.profilePicture == null ? null : NetworkImage(widget.profilePicture),
      ),
    );
  }
}
