import 'dart:async';

import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceTricks.dart';


class SkateDiceData {
  var skateDiceMap = _getDefault();

  List<SkateDiceTricks> flatArray = SkateDiceTricks.getFlatTricks();
  List<SkateDiceTricks> grindArray = SkateDiceTricks.getGrindTricks();
 // List<bool> manualArray = [];


  final StreamController _streamController = StreamController.broadcast();

  Stream get stream => _streamController.stream;

  Sink get sink => _streamController.sink;



  static List<Map> _getDefault() {
    List<ObstacleType> obstacleTypes = ObstacleType.values;
    List<SkateDiceObstacles> allObstacles = SkateDiceObstacles.getObstacles();

    var obstacleMap = List<Map>();

    for (int i = 0; i < obstacleTypes.length; i++) {
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


    return obstacleMap;
  }
}
