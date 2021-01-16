import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  Function function;
  String lableText;

  PasswordField(this.function, this.lableText);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();

}

class _PasswordFieldState extends State<PasswordField> {
  String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        //TODO:: better password validation
        validator: (val) => val.length < 6 ? 'Password must be 6 characters long' : null,
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
            widget.function(password);
          });
        },
        decoration:InputDecoration(
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