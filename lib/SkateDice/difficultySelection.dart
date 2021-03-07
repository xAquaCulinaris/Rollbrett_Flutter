import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';

import 'SkateDiceModelController.dart';

class DifficultySelection extends StatefulWidget {
  List<bool> difficultyArray;
  Function difficultyExpandedChange;
  bool difficultyExpanded;

  DifficultySelection(this.difficultyExpanded, this.difficultyExpandedChange,
      this.difficultyArray);

  @override
  _DifficultySelectionState createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: () {
              widget.difficultyExpandedChange();
            },
            child: Icon(widget.difficultyExpanded
                ? Icons.arrow_drop_down
                : Icons.arrow_right),
          ),
          Text("Difficulty"),
        ],
      ),
      widget.difficultyExpanded
          ? Column(
              children: <Widget>[
                CheckboxListTile(
                    title: Text("Easy"),
                    value: widget.difficultyArray[0],
                    onChanged: (newValue) {
                      selectDifficulty(0);
                    }),
                CheckboxListTile(
                    title: Text("Medium"),
                    value: widget.difficultyArray[1],
                    onChanged: (newValue) {
                      selectDifficulty(1);
                    }),
                CheckboxListTile(
                    title: Text("Hard"),
                    value: widget.difficultyArray[2],
                    onChanged: (newValue) {
                      selectDifficulty(2);
                    }),
              ],
            )
          : SizedBox.shrink(),
    ]);
  }

  void selectDifficulty(int n) {
    setState(() {
      for (int i = 0; i < widget.difficultyArray.length; i++) {
        widget.difficultyArray[i] = false;
      }
      widget.difficultyArray[n] = true;
    });

    switch (n) {
      case 0:
        SkateDiceModelController.of(context).difficulty = Difficulty.Easy;
        break;
      case 1:
        SkateDiceModelController.of(context).difficulty = Difficulty.Medium;
        break;
      case 2:
        SkateDiceModelController.of(context).difficulty = Difficulty.Hard;
        break;
    }
    print(SkateDiceModelController.of(context).difficulty);
  }
}
