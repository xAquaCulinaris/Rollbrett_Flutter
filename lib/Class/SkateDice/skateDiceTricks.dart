import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceObstacles.dart';

class SkateDiceTricks {
  final String name;
  final Stance stance;
  final ObstacleType obstacleType;
  final Difficulty difficulty;

  SkateDiceTricks(this.name, this.stance, this.obstacleType, this.difficulty);


  static SkateDiceTricks kickflip = SkateDiceTricks("Kickflip", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks heelflip = SkateDiceTricks("Heelflip", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks tre = SkateDiceTricks("360 Flip", Stance.All, ObstacleType.Flat, Difficulty.Medium);
  static SkateDiceTricks shuv = SkateDiceTricks("Shuv", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks three_shuv = SkateDiceTricks("3 Shuv", Stance.All, ObstacleType.Flat, Difficulty.Medium);
  static SkateDiceTricks one_eighty = SkateDiceTricks("180", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks varial_flip = SkateDiceTricks("Varial Flip", Stance.All, ObstacleType.Flat, Difficulty.Easy);
  static SkateDiceTricks varial_heel = SkateDiceTricks("Varial Heel", Stance.All, ObstacleType.Flat, Difficulty.Medium);


  static SkateDiceTricks noseSlide = SkateDiceTricks("Nose Slide", Stance.All, ObstacleType.Grind, Difficulty.Easy);
  static SkateDiceTricks boardslide = SkateDiceTricks("Boardslide", Stance.All, ObstacleType.Grind, Difficulty.Easy);
  static SkateDiceTricks noseGrind = SkateDiceTricks("Nose Grind", Stance.All, ObstacleType.Grind, Difficulty.Medium);
  static SkateDiceTricks fifty_fifty = SkateDiceTricks("50-50 Grind", Stance.All, ObstacleType.Grind, Difficulty.Easy);
  static SkateDiceTricks five_o = SkateDiceTricks("5-0 Grind", Stance.All, ObstacleType.Grind, Difficulty.Easy);
  static SkateDiceTricks smith = SkateDiceTricks("Smith Grind", Stance.All, ObstacleType.Grind, Difficulty.Medium);
  static SkateDiceTricks feeble = SkateDiceTricks("Feebel Grind", Stance.All, ObstacleType.Grind, Difficulty.Medium);
  static SkateDiceTricks blunt = SkateDiceTricks("Blunt Slide", Stance.All, ObstacleType.Grind, Difficulty.Hard);
  static SkateDiceTricks tailslide = SkateDiceTricks("Tail Slide", Stance.All, ObstacleType.Grind, Difficulty.Medium);
  static SkateDiceTricks croocked = SkateDiceTricks("Croocked Grind", Stance.All, ObstacleType.Grind, Difficulty.Medium);


  static List<SkateDiceTricks> getTricks() {
    List<SkateDiceTricks> list = [kickflip, noseSlide, boardslide, noseGrind, heelflip, tre, shuv, three_shuv, one_eighty, varial_flip, varial_heel, fifty_fifty, five_o, smith, feeble, blunt, tailslide, croocked];
    return list;
  }

  static List<SkateDiceTricks> getFlatTricks() {
    List<SkateDiceTricks> all = getTricks();
    List<SkateDiceTricks> filtered = List<SkateDiceTricks>();

    for(SkateDiceTricks trick in all) {
      if (trick.obstacleType == ObstacleType.Flat) {
        filtered.add(trick);
      }
    }
    return filtered;
  }

  static List<SkateDiceTricks> getGrindTricks() {
    List<SkateDiceTricks> all = getTricks();
    List<SkateDiceTricks> filtered = List<SkateDiceTricks>();

    for(SkateDiceTricks trick in all) {
      if (trick.obstacleType == ObstacleType.Grind) {
        filtered.add(trick);
      }
    }
    return filtered;
  }

  static List<SkateDiceTricks> getManualTricks() {
    List<SkateDiceTricks> all = getTricks();
    List<SkateDiceTricks> filtered = List<SkateDiceTricks>();

    for(SkateDiceTricks trick in all) {
      if (trick.obstacleType == ObstacleType.ManualPad) {
        filtered.add(trick);
      }
    }
    return filtered;
  }
}