import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/logoText.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String email = "";
  String username = "";
  String password = "";
  String passwordRepetition = "";

  bool _usernameAlreadyExits(String username) {
    return false;
  }

  void setEmail(String text) {
    email = text;
  }


  void setPassword(String text) {
    password = text;
  }

  void setPasswordRep(String text) {
    passwordRepetition = text;
  }

  void _registerButtonPressed() {
    print(email);
    print(passwordRepetition);
    print(password);

    if (email == "" || username == "" || password == "" || passwordRepetition == "") {
      print("All fields need to be filled out");
    }

    if(password != passwordRepetition) {
      print("Passwords dont match");
    }

    if(_usernameAlreadyExits(username)) {
      print("Username already exists");
    }
  }


  Widget _getContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.7,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .height / 30),
                      ),
                    ],
                  ),
                  EmailField(text: email, function: setEmail, labelText: "E-mail", icon: Icons.email),
                  _getUsername(),
                  PasswordField(setPassword, 'Password'),
                  PasswordField(setPasswordRep, 'Password Repetition'),
                  RoundedButton("Register", _registerButtonPressed ,40, 20),
                ],
              ),
            ))
      ],
    );
  }

  Widget _getUsername() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          labelText: 'Username',
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoText(),
                _getContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
