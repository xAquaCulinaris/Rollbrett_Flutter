import 'package:flutter/material.dart';

import 'package:rollbrett_rottweil/Login/registerView.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/logoText.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';

class LoginPage extends StatefulWidget {
  final Function toggleShowLogin;

  LoginPage(this.toggleShowLogin);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String error = '';

  String email;
  String password;

  void setEmail(String text) {
    email = text;
  }

  void setPassword(String text) {
    password = text;
  }

  void _loginButtonPressed() async {
    print(email);
    print(password);
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      dynamic result = _auth.signIn(email, password);
      if (result == null) {
        print("error");
        setState(() {
          error = 'something went wrong registering, maybe wrong email?';
          isLoading = false;
        });
      }
    }
  }

  //TODO: Fix automatic sign in on regsiter
  void _registerButtonPressed() {
    widget.toggleShowLogin();
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
              height: MediaQuery.of(context).size.height * 0.6,
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
                        "Login",
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
                            labelText: "E-Mail",
                            icon: Icons.email),
                        PasswordField(setPassword, 'Password'),
                        _getForgetPassword(),
                      ],
                    ),
                  ),
                  RoundedButton("Login", _loginButtonPressed, 40, 20),
                  RoundedButton("Sign Up", _registerButtonPressed, 40, 20),
                ],
              ),
            ))
      ],
    );
  }

  Widget _getPassword() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _getForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(onPressed: () {}, child: Text('Forget Password?')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Loading() : Scaffold(
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
