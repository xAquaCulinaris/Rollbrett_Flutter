import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/logoText.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';

class RegisterView extends StatefulWidget {
  final Function toggleShowLogin;

  RegisterView(this.toggleShowLogin);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String email = "";
  String username = "";
  String password = "";
  String passwordRepetition = "";

  String error = '';

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
    print(username);
    print(passwordRepetition);
    print(password);

    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      dynamic result = _auth.register(email, password);
      if (result == null) {
        setState(() {
          error = 'something went wrong registering, maybe wrong email?';
          isLoading = false;
        });
      }
    }
  }

  void _loginButtonPressed() {
    widget.toggleShowLogin();
  }

  //TODO: Fix automatic sign in on regsiter

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
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EmailField(
                            text: email,
                            function: setEmail,
                            labelText: "E-mail",
                            icon: Icons.email),
                        _getUsername(),
                        PasswordField(setPassword, 'Password'),
                        PasswordField(setPasswordRep, 'Password Repetition'),
                        RoundedButton(
                            "Register", _registerButtonPressed, 40, 20),
                        RoundedButton("Login", _loginButtonPressed, 40, 20)
                      ],
                    ),
                  )
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
        //TODO:: better username validation
        validator: (val) =>
            val.length < 5 ? 'Username must be 4 characters long' : null,
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
    return isLoading? Loading() : Scaffold(
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
    );
  }
}
