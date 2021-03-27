import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  String text;
  Function function;
  String labelText;
  IconData icon;
  TextInputType keyLayout;

  EmailField({this.text, this.function, this.labelText, this.icon, this.keyLayout});

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        validator: (val) => EmailValidator.validate(widget.text) ? null : 'Enter a valid email',
        keyboardType: widget.keyLayout == null ? TextInputType.emailAddress : widget.keyLayout,
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
