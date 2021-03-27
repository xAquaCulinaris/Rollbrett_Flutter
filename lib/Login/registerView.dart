import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/StanceSelectoin.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customMessageBox.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/logoText.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/usernameField.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';


class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();



  bool isLoading = false;

  String email = "";
  String username = "";
  String stance = "Regular";
  String password = "";
  String passwordRepetition = "";

  void setEmail(String text) {
    email = text;
  }

  void setPassword(String text) {
    password = text;
  }

  void setPasswordRep(String text) {
    passwordRepetition = text;
  }

  void setStance(String text) {
    stance = text;
  }

  void catchEmailError(Object err) {
    setState(() {
      isLoading = false;
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomMessageBox(
            "Error",
            "Account with this email already exists",
            "Okay",
          );
        });
  }

  void _registerButtonPressed() async {
    print(stance);
    if (_formKey.currentState.validate()) {
      if (!await UserService.userNameExists(username)) {
        setState(() {
          isLoading = true;
        });
        //TODO fix changeing view on registration (it doesent change to home screen right now)
        _auth.register(email, password, username, stance).catchError(catchEmailError);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomMessageBox(
              "Error",
              "Username already exists!",
              "Okay",
            );
          },
        );
      }
    }
  }

  void _setUsername(String value) {
    if (mounted) {
      setState(() {
        username = value;
      });
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
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
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
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height / 30),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EmailField(text: email, function: setEmail, labelText: "E-mail", icon: Icons.email),
                        UsernameField(username, _setUsername),
                        StanceSelection(stance, setStance),
                        PasswordField(setPassword, 'Password', true),
                        PasswordField(setPasswordRep, 'Password Repetition', false),
                        RoundedButton("Register", _registerButtonPressed, 40, 20),
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0xfff2f3f7),
            body: SingleChildScrollView(
              child: Stack(
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
