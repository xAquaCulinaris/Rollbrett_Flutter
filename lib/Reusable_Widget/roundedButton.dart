import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function function;
  final double textSize;
  final double buttonSize;

  RoundedButton(this.text, this.function, this.textSize, this.buttonSize);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / buttonSize),
          width: 5 * (MediaQuery.of(context).size.width / (buttonSize/2)),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: function,
            child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.height / textSize)),
            )

          ),
        )
      ],
    );
  }
}
