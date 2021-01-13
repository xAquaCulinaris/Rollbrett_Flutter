import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceCheckBox.dart';

class SkateDiceExpandableCheckBox extends StatefulWidget {
  final List<Map> map;
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



            Expanded(
              child: CheckboxListTile(
                  title: Text(widget.map[widget.index]['obstacleType'].toString()),
                  value: widget.map[widget.index]['isChecked'],
                  onChanged: (newValue) {
                    setState(() {
                      widget.map[widget.index]['isChecked'] = newValue;

                       if (!newValue) {
                      widget.map[widget.index]['isExpanded'] = false;
                    }
                    });
                  }),
            )
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
