import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  String text;
  Function function;

  EmailField(this.text, this.function);


  @override
  _EmailFieldState createState() => _EmailFieldState();
}


class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            widget.text = value;
            widget.function(widget.text);
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
}