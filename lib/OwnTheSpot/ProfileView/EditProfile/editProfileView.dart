import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/OwnTheSpot/ProfileView/profilePicture.dart';
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
  final _formKey = GlobalKey<FormState>();

  String uid = AuthService.userID;
  User user;
  bool changedPicture = false;
  String profilePicture;
  String username;
  String password;

  //TODO: need to fix image upload (and image change)

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

  void _saveButtonPressed() async {
    bool error = false;
    if (_formKey.currentState.validate()) {
      if (username != user.name) {
        if (await UserServiceTest.userNameExists(username)) {
          error = true;
        }
      }
    } else {
      error = true;
    }

    if (!error) {
      UserServiceTest.updateUser(
          uid, username, changedPicture ? profilePicture : 'avatar.png');
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
                  UsernameField(user.name, _setUsername),
                  PasswordField(_setPassword, 'Password', true),
                  stanceSelection(),
                  RoundedButton('Save', _saveButtonPressed, 40, 20),
                ],
              ),
      ),
    );
  }

  Widget stanceSelection() {
    String currentStance = 'Regular';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        child: DropdownButton<String>(
          value: currentStance,
          elevation: 16,
          underline: Container(
            height: 1,
            color: Colors.grey,
          ),
          onChanged: (String newValue) {
            setState(() {
              currentStance = newValue;
            });
          },
          items: <String>['Regular', 'Goofy']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
