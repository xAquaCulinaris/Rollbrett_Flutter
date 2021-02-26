import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceCheckBox.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceModelController.dart';

class SkateDiceExpandableCheckBox extends StatefulWidget {

  final int index;

  SkateDiceExpandableCheckBox(this.index);


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
                    !SkateDiceModelController.of(context).skateDiceMap[widget.index]['isExpanded'] ? Icons.arrow_right : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    SkateDiceModelController.of(context).skateDiceMap[widget.index]['isExpanded'] = !SkateDiceModelController.of(context).skateDiceMap[widget.index]['isExpanded'];
                  });
                }),



            Expanded(
              child: CheckboxListTile(
                  title: Text(SkateDiceModelController.of(context).skateDiceMap[widget.index]['obstacleType'].toString()),
                  value: SkateDiceModelController.of(context).skateDiceMap[widget.index]['isChecked'],
                  onChanged: (newValue) {
                    setState(() {
                      SkateDiceModelController.of(context).skateDiceMap[widget.index]['isChecked'] = newValue;

                       if (!newValue) {
                         SkateDiceModelController.of(context).skateDiceMap[widget.index]['isExpanded'] = false;
                    }
                    });
                  }),
            )
          ],
        ),
        SkateDiceModelController.of(context).skateDiceMap[widget.index]['isExpanded'] ?
       ListView.builder(
           scrollDirection: Axis.vertical,
           shrinkWrap: true,
           itemCount:  SkateDiceModelController.of(context).skateDiceMap[widget.index]['itemCount'],
           itemBuilder: (BuildContext context, int index) =>
           SkateDiceCheckBox(SkateDiceModelController.of(context).skateDiceMap, widget.index, index)
       ) : Text(""),
      ],
    );
  }
}
