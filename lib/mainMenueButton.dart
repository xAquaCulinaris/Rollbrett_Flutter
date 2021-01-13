import 'package:flutter/material.dart';

class MainMenueButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function func;
  final BuildContext context;

  MainMenueButton(this.text, this.icon, this.func, this.context);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.grey,
      onPressed: () {func(context);},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 2.4,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 4.5,
              ),
              Text(text, style: TextStyle(fontSize: 20)),
            ],
          ))),
    );
  }
}
