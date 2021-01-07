import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  String text;
  Function function;
  String labelText;
  IconData icon;


  EmailField(this.text, this.function, this.labelText, this.icon);

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
            widget.icon,
            color: Colors.grey,
          ),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}