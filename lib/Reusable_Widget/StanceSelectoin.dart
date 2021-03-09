import 'package:flutter/material.dart';

class StanceSelection extends StatefulWidget {
  String currentStance;
  Function setStance;

  StanceSelection(this.currentStance, this.setStance);

  @override
  _StanceSelectionState createState() => _StanceSelectionState();
}

class _StanceSelectionState extends State<StanceSelection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        child: DropdownButton<String>(
          value: widget.currentStance,
          elevation: 16,
          underline: Container(
            height: 1,
            color: Colors.grey,
          ),
          onChanged: (String newValue) {
            setState(() {
              widget.currentStance = newValue;
            });
            widget.setStance(widget.currentStance);
          },
          items: <String>['Regular', 'Goofy'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
