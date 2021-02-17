import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function func;
  final BuildContext context2;

  DrawerButton(this.icon, this.text, this.func, this.context2);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
            onPressed: () {
              func(context2);
            },
            child: Row(
              children: [Icon(icon, color: Colors.grey), Text(text)],
            ))
      ],
    );
  }
}
