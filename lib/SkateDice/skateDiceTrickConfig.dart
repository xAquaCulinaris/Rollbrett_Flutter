import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceTricks.dart';

class SkateDiceTrickConfig extends StatefulWidget {
  @override
  _SkateDiceTrickConfigState createState() => _SkateDiceTrickConfigState();
}

class _SkateDiceTrickConfigState extends State<SkateDiceTrickConfig> {
  bool flatExpanded = false;
  bool grindExpanded = false;
  bool manualExpanded = false;

  List<SkateDiceTricks> flatTricks = SkateDiceTricks.getFlatTricks();
  List<SkateDiceTricks> grindTricks = SkateDiceTricks.getGrindTricks();
  List<SkateDiceTricks> maunalTricks = SkateDiceTricks.getManualTricks();

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        expandableBox("Flat Tricks", flatExpanded, flatExpandedChange,
            flatTricks, ObstacleType.Flat),
        expandableBox("Grinds & Slides", grindExpanded, grindExpandedChange,
            grindTricks, ObstacleType.Grind),
        expandableBox("Manuals", manualExpanded, manualExpandedChange,
            maunalTricks, ObstacleType.ManualPad),
      ],
    );
  }

  Widget expandableBox(String name, bool state, Function changeState,
      List<SkateDiceTricks> tricks, ObstacleType type) {
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
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: tricks.length,
                itemBuilder: (BuildContext context, int index) =>
                    trickItem(index, tricks))
            : SizedBox.shrink()
      ],
    );
  }

  Widget trickItem(int index, List<SkateDiceTricks> trickList) {
    return Row(
      children: [
        Text(trickList[index].name),
      ],
    );
  }
}
