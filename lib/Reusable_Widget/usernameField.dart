import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  String username;
  Function func;

  UsernameField(this.username, this.func);

  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        //TODO:: better username validation
        validator: (val) => val.length < 4 ? 'Username must be 4 characters' : null,
        keyboardType: TextInputType.text,
        onChanged: (value) {
         widget.func(value);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          labelText: 'Username',
        ),
      ),
    );
  }
}
