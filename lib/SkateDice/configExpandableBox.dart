import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/SkateDice/trickListTile.dart';

class ConfigExpandableBox extends StatefulWidget {
  String name;
  bool state;
  Function changeState;
  List<SkateDiceTricks> tricks;
  ObstacleType type;
  List<bool> checkBoxStates;
  List<SkateDiceTricks> trickArray;

  ConfigExpandableBox(this.name, this.state, this.changeState, this.tricks, this.type, this.checkBoxStates, this.trickArray);


  @override
  _ConfigExpandableBoxState createState() => _ConfigExpandableBoxState();
}

class _ConfigExpandableBoxState extends State<ConfigExpandableBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlatButton(
              onPressed: () {
                widget.changeState();
              },
              child: Icon(widget.state ? Icons.arrow_drop_down : Icons.arrow_right),
            ),
            Text(widget.name),
          ],
        ),
        widget.state
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.tricks.length,
                itemBuilder: (BuildContext context, int index) =>
                    TrickListTile(index, widget.tricks[index], widget.checkBoxStates, widget.trickArray))
            : SizedBox.shrink()
      ],
    );
  }
}
