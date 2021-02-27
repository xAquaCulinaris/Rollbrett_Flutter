import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDicePlayer.dart';

class SkateDicePlayerScoreItem extends StatefulWidget {
  final SkateDicePlayer player;
  bool isLastPlayer;

  SkateDicePlayerScoreItem(this.player, this.isLastPlayer);

  @override
  _SkateDicePlayerScoreItemState createState() =>
      _SkateDicePlayerScoreItemState();
}

class _SkateDicePlayerScoreItemState extends State<SkateDicePlayerScoreItem> {
  final skateLetters = ["S", "K", "A", "T", "E"];
  int letters = 0;

  Widget _getScoreText() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < skateLetters.length; i++) {
      if (letters <= i)
        list.add(_getLetterWhite(skateLetters[i]));
      else
        list.add(_getLetterGrey(skateLetters[i]));
    }

    return new Row(children: list);
  }

  Widget _getLetterWhite(String letter) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(letter, style: TextStyle(fontSize: 20)),
          )),
    );
  }

  Widget _getLetterGrey(String letter) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey, border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(letter, style: TextStyle(fontSize: 20, color: Colors.black)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(widget.player.name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Row(children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {
                    if (letters > 0) letters--;
                  });
                },
              ),
              letters < 5
                  ? _getScoreText()
                  : widget.isLastPlayer
                      ? Text("Winner")
                      : Text("Lost"),
              IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    setState(() {
                      if (letters < 5) letters++;
                    });
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}
