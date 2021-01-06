import 'package:flutter/material.dart';

import 'package:rollbrett_rottweil/Login/registerView.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/logoText.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;


  void setEmail(String text) {
    email = text;
  }

  void _loginButtonPressed() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false,
    );
  }

  void _registerButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterView()),
    );
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
                  //_getEmail(),
                  EmailField(email, setEmail),
                  _getPassword(),
                  _getForgetPassword(),
                  RoundedButton("Login", _loginButtonPressed, 40, 20),
                  RoundedButton("Sign Up", _registerButtonPressed ,40, 20),
                ],
              ),
            ))
      ],
    );
  }

  Widget _getEmail() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
          labelText: 'E-mail',
        ),
      ),
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
