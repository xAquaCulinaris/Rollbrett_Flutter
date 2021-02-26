import 'dart:async';

import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';
import 'package:rollbrett_rottweil/Class/skateDicePlayer.dart';
import 'package:rollbrett_rottweil/Class/skateDiceTricks.dart';

class SkateDiceData {
  List<SkateDicePlayer> players = [];
  List<SkateDiceObstacles> obstacleList = [];
  List<SkateDiceTricks> obstacleTricks = [];
  var skateDiceMap = _getDefault();
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

    print(obstacleMap);

    return obstacleMap;
  }
}
