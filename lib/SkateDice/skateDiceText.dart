import 'package:flutter/material.dart';


class SkateDiceText extends StatefulWidget {
  final String text;

  SkateDiceText(this.text);

  @override
  _SkateDiceTextState createState() => _SkateDiceTextState();

}

class _SkateDiceTextState extends State<SkateDiceText> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700])
        ),

        child:  Center(
          child: Text(widget.text),
        )
    );
  }

}