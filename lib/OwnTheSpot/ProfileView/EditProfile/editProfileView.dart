import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/profilePicture.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/StanceSelectoin.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customMessageBox.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/usernameField.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';
import 'package:rollbrett_rottweil/firebase/fireStorageService.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();

  String currentStance = 'Regular';

  String uid = AuthService.userID;
  User user;
  bool changedPicture = false;
  String profilePicture;
  String username;
  String password;

  String errorText;

  //TODO: need to fix image upload (and image change)

  @override
  void initState() {
    super.initState();
    _getUser();
    _getImage();
  }

  void _getUser() async {
    await UserService.getUser(uid).then((value) {
      if (mounted)
        setState(() {
          user = value;
          username = user.name;
          currentStance = user.stance;
        });
      print(username);
      print(currentStance);
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

  //TODO add change password logic

  void _saveButtonPressed() async {
    print(currentStance);
    bool error = false;
    if (_formKey.currentState.validate()) {
      if (username != user.name) {
        if (await UserService.userNameExists(username)) {
          error = true;
          errorText = "Username already exists!";
        }
      }
    } else {
      error = true;
    }

    String changeName;
    String changeStance;
    String changeProfilePic;

    changeName = username != user.name ? username : user.name;
    changeStance = currentStance != user.stance ? currentStance : user.stance;
    changeProfilePic = changedPicture
        ? profilePicture
        : 'https://firebasestorage.googleapis.com/v0/b/rollbrett-rottweil-flutter.appspot.com/o/thumbnails%2F1a817c2a-0291-4af6-af22-4904fa72c12c?alt=media&token=1dec4a49-b478-4807-94c1-301bcc7f1727';

    if (!error) {
      UserService.updateUser(uid, changeName, changeProfilePic, changeStance);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomMessageBox.fromCustomMessageBox(
              "Success",
              "Updated data Successfully",
              "Okay",
              true,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomMessageBox(
              "Error",
              errorText,
              "Okay",
            );
          });
    }
  }

  void _setUsername(String value) {
    if (mounted) {
      setState(() {
        username = value;
      });
    }
  }

  void _setPassword(String value) {
    if (mounted) {
      setState(() {
        password = value;
      });
    }
  }

  void _setStance(String text) {
    currentStance = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
      ),
      body: Form(
        key: _formKey,
        child: user == null
            ? Loading()
            : Column(
                children: [
                  ProfilePicture(profilePicture),
                  UsernameField(username, _setUsername),
                  PasswordField(_setPassword, 'Password', true),
                  StanceSelection(currentStance, _setStance),
                  RoundedButton('Save', _saveButtonPressed, 40, 20),
                ],
              ),
      ),
    );
  }
}
