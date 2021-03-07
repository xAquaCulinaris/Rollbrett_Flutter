import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/SkateDice/popUpImage.dart';

class SkateDiceText extends StatefulWidget {
  final Map<String, String> map;

  SkateDiceText(this.map);

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
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[700])),
        child: Center(
          child: Column(
            children: [
              widget.map['picture'] != 'null'
                  ? CircleAvatar(
                      child: GestureDetector(
                        onTap: () async {
                          await showDialog(context: context, builder: (_) => PopUpImage(widget.map['picture']));
                        },
                      ),
                      radius: 15.0,
                      backgroundImage: AssetImage('assets/info_icon.png'),
                    )
                  : Text(""),
              Text(widget.map['name']),
            ],
          ),
        ));
  }
}
