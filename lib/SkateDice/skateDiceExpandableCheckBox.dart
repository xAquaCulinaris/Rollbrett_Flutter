import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceCheckBox.dart';

class SkateDiceExpandableCheckBox extends StatefulWidget {
  List<Map> map;
  final int index;

  SkateDiceExpandableCheckBox(this.map, this.index);


  @override
  _SkateDiceExpandableCheckBoxState createState() => _SkateDiceExpandableCheckBoxState();
}

class _SkateDiceExpandableCheckBoxState extends State<SkateDiceExpandableCheckBox> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                    !widget.map[widget.index]['isExpanded'] ? Icons.arrow_right : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    widget.map[widget.index]['isExpanded'] = !widget.map[widget.index]['isExpanded'];
                  });
                }),
            Text(widget.map[widget.index]['obstacleType'].toString())
          ],
        ),
       widget.map[widget.index]['isExpanded'] ?
       ListView.builder(
           scrollDirection: Axis.vertical,
           shrinkWrap: true,
           itemCount:  widget.map[widget.index]['itemCount'],
           itemBuilder: (BuildContext context, int index) =>
           SkateDiceCheckBox(widget.map, widget.index, index)
       ) : Text(""),
      ],
    );
  }
}
