import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/customMessageBox.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/loading.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/logoText.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/passwordField.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/roundedButton.dart';
import 'package:rollbrett_rottweil/firebase/authService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String error = '';

  String email = '';
  String password = '';

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
      dynamic result = await _auth.signIn(email, password);

      if (result == null) {
        print("error");
        setState(() => isLoading = false);

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomMessageBox(
                "Error",
                'Something went wrong,t maybe wrong email or password?',
                "Okay",
              );
            });
      }
    }
  }

  void _registerButtonPressed() {
    Navigator.of(context).pushNamed('/register');
  }

  void _resetPassButtonPressed() async {
    if (email != '')
      AuthService.resetPassword(email).then((value) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomMessageBox(
                "Success",
                "Password reset link has been sent to your email!",
                "Okay",
              );
            });
      });
    else
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomMessageBox(
              "Error",
              "Enter a valid email to reset your Password!",
              "Okay",
            );
          });
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
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height / 30),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EmailField(text: email, function: setEmail, labelText: "E-Mail", icon: Icons.email),
                        PasswordField(setPassword, 'Password', false),
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

  Widget _getForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
            onPressed: () {
              _resetPassButtonPressed();
            },
            child: Text('Forget Password?')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
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
