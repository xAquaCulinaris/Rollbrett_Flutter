import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/profilePicture.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customAppBar.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/usernameField.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';
import 'package:rollbrett_rottweil/firebase/userServiceTest.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {

  String uid = AuthService.userID;
  User user;
  String profilePicture;
  String username;
  String password;



  @override
  void initState() {
    _getUser();
    _getImage();
    super.initState();
  }

  void _getUser() async {
    await UserServiceTest.getUser(uid).then((value) {
      if (mounted)
        setState(() {
          user = value;
        });
    });
  }

  void _getImage() async {
    await FireStorageService.getImageFromUID(uid).then((value) {
      if (mounted) {
        setState(() {
          profilePicture = value;
        });
      }
    });
  }
  void _saveButtonPressed() {

  }

  void _setPassword(String value) {
    if(mounted) {
      setState(() {
        password = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit profile'),),
      body:  user == null ? Loading() : Column(
          children: [
            ProfilePicture(profilePicture),
            UsernameField(user.name),
            PasswordField(_setPassword, 'Password', true),
            RoundedButton('Save', _saveButtonPressed, 40, 20),
          ],
      )
    );
  }
}
