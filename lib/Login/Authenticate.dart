import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Login/loginView.dart';
import 'package:rollbrett_rottweil/Login/registerView.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;

  void toggleShowLogin(){
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    return showLogin ? LoginPage(toggleShowLogin): RegisterView(toggleShowLogin);
  }
}
