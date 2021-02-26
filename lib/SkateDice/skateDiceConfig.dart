import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDiceTricks.dart';
import 'package:rollbrett_rottweil/SkateDice/SkateDiceModelController.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDices.dart';
import 'package:rollbrett_rottweil/SkateDice/skateDiceExpandableCheckBox.dart';

class SkateDiceConfig extends StatefulWidget {
  @override
  _SkateDiceConfigState createState() => _SkateDiceConfigState();
}

class _SkateDiceConfigState extends State<SkateDiceConfig> {
  List<ObstacleType> obstacleTypes = ObstacleType.values;
//  List<SkateDiceObstacles> allObstacles = SkateDiceObstacles.getObstacles();

 // var obstacleMap = <Map>[];


  @override
  void initState() {
    super.initState();

    /*for (int i = 0; i < obstacleTypes.length; i++) {
      var map = {};


      var obstacleList = [];
      for (int j = 0; j < allObstacles.length; j++) {
        var obstaclesMap = {};

        if (obstacleTypes[i] == allObstacles[j].obstacleType) {
          obstaclesMap['obstacleName'] = allObstacles[j].name;
          obstaclesMap['isChecked'] = true;
          obstacleList.add(obstaclesMap);
        }
      }

      map['obstacleType'] = obstacleTypes[i].toString();
      map['isExpanded'] = true;
      map['isChecked'] = true;
      map['obstacles'] = obstacleList;
      map['itemCount'] = obstacleList.length;

      obstacleMap.add(map);
    }


    print(obstacleMap);*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Skate Dice Configuration"),
        ),
        body: Column(
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: obstacleTypes.length,
                itemBuilder: (BuildContext context, int index) =>
                //_dropDownList(obstacleTypes[index], index),
                SkateDiceExpandableCheckBox(index)
            ),


            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: FloatingActionButton(onPressed: null/*_startGame*/, child: Icon(Icons.navigate_next, size: 50,),),
                ),
              ),
            ),
          ],
        ),
    );
  }


  /*void _startGame() {
    List<SkateDiceObstacles> obstacleList = [];
    List<SkateDiceTricks> obstacleTricks = [];

    List<SkateDiceTricks> allTricks = SkateDiceTricks.getTricks();
    List<SkateDiceObstacles> allObstacle = SkateDiceObstacles.getObstacles();



    for (int x = 0; x < SkateDiceModelController.of(context).skateDiceMap.length; x++) {
      //TODO when no is selected disable checkbox
      //need to look if at least one children ist checked
      if(SkateDiceModelController.of(context).skateDiceMap[x]['isChecked'] == true) {
        //loop trough all tricks and add them
        for (int z = 0; z < allTricks.length; z++) {
          var test1 = SkateDiceModelController.of(context).skateDiceMap[x]['obstacleType'];
          var test2 = allTricks[z].obstacleType.toString();

          if (test1 == test2) {
            obstacleTricks.add(allTricks[z]);
            SkateDiceModelController.of(context).obstacleTricks.add(allTricks[z]);
          }
        }

        //loop through all obstacles and add them if 'isChecked' is true
        for (int y = 0; y < SkateDiceModelController.of(context).skateDiceMap[x]['itemCount']; y++) {
          if(SkateDiceModelController.of(context).skateDiceMap[x]['obstacles'][y]['isChecked']) {
            for(SkateDiceObstacles toAdd in allObstacle) {
              if(toAdd.name == SkateDiceModelController.of(context).skateDiceMap[x]['obstacles'][y]['obstacleName']) {
                obstacleList.add(toAdd);
                SkateDiceModelController.of(context).obstacleList.add(toAdd);
              }
            }
          }
        }
      }
    }

  //TODO FIx PLAYER LIST
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkateDices(SkateDiceModelController.of(context).players, SkateDiceModelController.of(context).obstacleList, SkateDiceModelController.of(context).obstacleTricks)),
    );
  }*/
}

