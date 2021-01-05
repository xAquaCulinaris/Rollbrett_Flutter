import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;


  void _loginButtonPressed() {
    print("Login pressed");
  }

  void _registerButtonPressed() {
    print("Register pressed");
  }


  Widget _getLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            "Rollbrett Rottweil",
            style: TextStyle(
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height / 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )
      ],
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
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
                        "Login",
                        style: TextStyle(
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .height / 30),
                      ),
                    ],
                  ),
                  _getEmail(),
                  _getPassword(),
                  _getForgetPassword(),
                  _getButton("Login", _loginButtonPressed),
                  _getButton("Sign Up", _registerButtonPressed),
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
        decoration:InputDecoration(
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
        FlatButton(
          onPressed: () {},
          child:Text('Forget Password?')
        ),
      ],
    );
  }

  Widget _getButton(String text, Function func) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery
              .of(context)
              .size
              .height / 20),
          width: 5 * (MediaQuery
              .of(context)
              .size
              .width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: func,
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height / 40)),
          ),
        )
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.7,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                _getLogo(),
                _getContainer(),
              ],
            )
          ],
        ),),);
  }
}
