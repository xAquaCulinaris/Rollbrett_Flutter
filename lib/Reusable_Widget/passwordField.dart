import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  Function function;
  String lableText;
  final bool checkPassword;

  PasswordField(this.function, this.lableText, this.checkPassword);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String password;

  String checkPassword() {
    if (password != null) {
      int counter = 0;
      if (widget.checkPassword == true) {
        if (password.length < 6 || password.length > 16)
          return "Password length needs to be inbetween 6 and 16";
        else {
          if (RegExp(r'.*[A-Z].*').hasMatch(password)) counter++;
          if (RegExp(r'.*[a-z].*').hasMatch(password)) counter++;
          if (RegExp(".*[*.!@#\$%^&(){}[\]:;'<>,.?\/~`_+-=|\\].*")
              .hasMatch(password)) counter++;
          if (RegExp(r".*[0-9].*").hasMatch(password)) counter++;
        }
      } else {
        if (password.length >= 6 && password.length < 16) {
          counter = 2;
        } else {
          return "Password length needs to be inbetween 6 and 16";
        }
      }

      print("matchs counter: " + counter.toString());
      return counter >= 2
          ? null
          : "Password must contain at least one upper case letter OR Digit OR special character";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        validator: (val) => checkPassword(),
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
            widget.function(password);
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          labelText: widget.lableText,
        ),
      ),
    );
  }
}
