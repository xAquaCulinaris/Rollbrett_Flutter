import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function func;

  DrawerButton(this.icon, this.text, this.func);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(onPressed: func, child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            Text(text)
          ],
        ))
      ],
    );
  }
}
