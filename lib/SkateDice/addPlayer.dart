import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Reusable_Widget/emailField.dart';


class AddPlayer extends StatefulWidget {
  Function func;

  AddPlayer(this.func);

  @override
  _AddPlayerState createState() => _AddPlayerState();
}


class _AddPlayerState extends State<AddPlayer> {
  String name;

  void setPlayerName(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EmailField(
              text: name,
              function: setPlayerName,
              labelText: "Add Player",
              icon: Icons.person_add,
              keyLayout: TextInputType.text),
        ),
        IconButton(
            icon: Icon(Icons.add_circle_outline), onPressed: () => widget.func(name))
      ],
    );
  }
}
