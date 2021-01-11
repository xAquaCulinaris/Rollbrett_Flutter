import 'package:rollbrett_rottweil/Class/skateDiceObstacles.dart';

class SkateDiceTricks {
  final String name;
  final Stance stance;
  final ObstacleType obstacleType;
  final Difficulty difficulty;

  SkateDiceTricks(this.name, this.stance, this.obstacleType, this.difficulty);


  static SkateDiceTricks kickflip = SkateDiceTricks("Kickflip", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks heelflip = SkateDiceTricks("Heelflip", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks tre = SkateDiceTricks("360 Flip", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks shuv = SkateDiceTricks("Shuv", Stance.All, ObstacleType.Flat, Difficulty.Easy);


  static SkateDiceTricks noseSlideLedge = SkateDiceTricks("Nose Slide", Stance.All, ObstacleType.Ledge, Difficulty.Easy);
  static SkateDiceTricks noseSlideRail = SkateDiceTricks("Nose Slide", Stance.All, ObstacleType.Rail, Difficulty.Medium);
  static SkateDiceTricks boardslide = SkateDiceTricks("Boardslide", Stance.All, ObstacleType.Rail, Difficulty.Easy);
  static SkateDiceTricks noseGrind = SkateDiceTricks("Nose Grind", Stance.All, ObstacleType.Ledge, Difficulty.Medium);

  static List<SkateDiceTricks> getTricks() {
    List<SkateDiceTricks> list = [kickflip, noseSlideLedge, noseSlideRail, boardslide, noseGrind, heelflip, tre, shuv];
    return list;
  }
}