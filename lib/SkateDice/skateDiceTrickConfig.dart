import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceModelController.dart';
import 'package:rollbrett_rottweil/SkateDice/difficultySelection.dart';

class SkateDiceTrickConfig extends StatefulWidget {
  @override
  _SkateDiceTrickConfigState createState() => _SkateDiceTrickConfigState();
}

class _SkateDiceTrickConfigState extends State<SkateDiceTrickConfig> {
  bool flatExpanded = false;
  bool grindExpanded = false;
  bool manualExpanded = false;
  bool difficultyExpanded = false;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < flatTricks.length; i++) {
      flatArray.add(true);
    }
    for (int i = 0; i < grindTricks.length; i++) {
      grindArray.add(true);
    }
  }

  List<bool> flatArray = [];
  List<bool> grindArray = [];
  List<bool> difficultyArray = [true, false, false];

  List<SkateDiceTricks> flatTricks = SkateDiceTricks.getFlatTricks();
  List<SkateDiceTricks> grindTricks = SkateDiceTricks.getGrindTricks();
  List<SkateDiceTricks> manualTricks = SkateDiceTricks.getManualTricks();

  void flatExpandedChange() {
    if (mounted) {
      setState(() {
        flatExpanded = !flatExpanded;
      });
    }
  }

  void grindExpandedChange() {
    if (mounted) {
      setState(() {
        grindExpanded = !grindExpanded;
      });
    }
  }

  void manualExpandedChange() {
    if (mounted) {
      setState(() {
        manualExpanded = !manualExpanded;
      });
    }
  }

  void difficultyExpandedChange() {
    if (mounted) {
      setState(() {
        difficultyExpanded = !difficultyExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      expandableBox(
          "Flat Tricks",
          flatExpanded,
          flatExpandedChange,
          flatTricks,
          ObstacleType.Flat,
          flatArray,
          SkateDiceModelController.of(context).flatArray),
      expandableBox(
          "Grinds & Slides",
          grindExpanded,
          grindExpandedChange,
          grindTricks,
          ObstacleType.Grind,
          grindArray,
          SkateDiceModelController.of(context).grindArray),
     // difficultyExpandable(),
      DifficultySelection(difficultyExpanded, difficultyExpandedChange, difficultyArray)
      //   expandableBox("Manuals", manualExpanded, manualExpandedChange,
      //  manualTricks, ObstacleType.ManualPad,  SkateDiceModelController.of(context).manualArray),
    ]);
  }

  Widget expandableBox(
      String name,
      bool state,
      Function changeState,
      List<SkateDiceTricks> tricks,
      ObstacleType type,
      List<bool> checkBoxStates,
      List<SkateDiceTricks> trickArray) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlatButton(
              onPressed: () {
                changeState();
              },
              child: Icon(state ? Icons.arrow_drop_down : Icons.arrow_right),
            ),
            Text(name),
          ],
        ),
        state
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: tricks.length,
                itemBuilder: (BuildContext context, int index) =>
                    trickItem(index, tricks, checkBoxStates, trickArray))
            : SizedBox.shrink()
      ],
    );
  }

  Widget trickItem(int index, List<SkateDiceTricks> trickList,
      List<bool> checkStatus, List<SkateDiceTricks> trickArray) {
    return CheckboxListTile(
      title: Text(trickList[index].name),
      value: checkStatus[index],
      onChanged: (newValue) {
        setState(() {
          checkStatus[index] = newValue;

          if (newValue)
            trickArray.add(trickList[index]);
          else
            trickArray.remove(trickList[index]);
        });
      },
    );
  }

 /* Widget difficultyExpandable() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: () {
              difficultyExpandedChange();
            },
            child: Icon(
                difficultyExpanded ? Icons.arrow_drop_down : Icons.arrow_right),
          ),
          Text("Difficulty"),
        ],
      ),
      difficultyExpanded
          ? Column(
              children: <Widget>[
                CheckboxListTile(
                    title: Text("Easy"), value: difficultyArray[0], onChanged: (newValue) {selectDifficulty(0);}),
                CheckboxListTile(
                    title: Text("Medium"), value: difficultyArray[1], onChanged: (newValue) {selectDifficulty(1);}),
                CheckboxListTile(
                    title: Text("Hard"), value: difficultyArray[2], onChanged: (newValue) {selectDifficulty(2);}),
              ],
            )
          : SizedBox.shrink(),
    ]);
  }


  void selectDifficulty(int n) {
    setState(() {
      for(int i = 0; i<difficultyArray.length; i++){
        difficultyArray[i] = false;
      }
      difficultyArray[n] = true;
    });

    switch (n){
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
  }*/
}
