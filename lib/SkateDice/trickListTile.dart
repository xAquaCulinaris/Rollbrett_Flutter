import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceTricks.dart';

class TrickListTile extends StatefulWidget {
  int index;
  SkateDiceTricks trick;
  List<bool> checkStatus;
  List<SkateDiceTricks> trickArray;

  TrickListTile(this.index, this.trick, this.checkStatus, this.trickArray);

  @override
  _TrickListTileState createState() => _TrickListTileState();
}

class _TrickListTileState extends State<TrickListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.trick.name),
      value: widget.checkStatus[widget.index],
      onChanged: (newValue) {
        setState(() {
          widget.checkStatus[widget.index] = newValue;

          if (newValue)
            widget.trickArray.add(widget.trick);
          else
            widget.trickArray.remove(widget.trick);
        });
      },
    );
  }
}
