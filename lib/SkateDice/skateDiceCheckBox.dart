import 'package:flutter/material.dart';

class SkateDiceCheckBox extends StatefulWidget {
  final List<Map> map;
  final int indexType;
  final int indexObstacle;

  SkateDiceCheckBox(this.map, this.indexType, this.indexObstacle);

  @override
  _SkateDiceCheckBoxState createState() => _SkateDiceCheckBoxState();
}

class _SkateDiceCheckBoxState extends State<SkateDiceCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Row(
          children: [
            Spacer(flex: 1),
            Text(widget.map[widget.indexType]['obstacles'][widget.indexObstacle]['obstacleName']),
            Spacer(flex: 2),
          ],
        ),
        value: widget.map[widget.indexType]['obstacles'][widget.indexObstacle]['isChecked'],
        onChanged: (newValue) {
          setState(() {
            widget.map[widget.indexType]['obstacles'][widget.indexObstacle]['isChecked'] = newValue;
          });
        });
  }
}
