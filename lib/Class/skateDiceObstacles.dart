
class SkateDiceObstacles {
  final String name;
  final ObstacleType obstacleType;
  final Difficulty difficulty;
  final Direction direction;

  SkateDiceObstacles(this.name, this.obstacleType, this.difficulty, this.direction);

  static SkateDiceObstacles flatRail = SkateDiceObstacles("Flat Rail", ObstacleType.Rail, Difficulty.Medium, Direction.All);
  static SkateDiceObstacles hubba = SkateDiceObstacles("Hubba", ObstacleType.Ledge, Difficulty.Medium, Direction.All);
  //static SkateDiceObstacles manualPad = SkateDiceObstacles("Manual Pad", ObstacleType.ManualPad, Difficulty.Easy, Direction.All);
  static SkateDiceObstacles manualPadLedge = SkateDiceObstacles("Manual Pad Ledge", ObstacleType.Ledge, Difficulty.Medium, Direction.All);
  static SkateDiceObstacles flatground = SkateDiceObstacles("Flatground", ObstacleType.Flat, Difficulty.Easy, Direction.None);



  static List<SkateDiceObstacles> getObstacles() {
    List<SkateDiceObstacles> list = [flatRail, hubba, flatground, manualPadLedge];
    return list;
  }
}


enum ObstacleType {
  Rail,
  Ledge,
  Flat,
  ManualPad,
}

enum Difficulty {
  Easy,
  Medium,
  Hard,
}

enum Stance {
  All,
  Regular,
  Switch,
  Fakie,
  Nollie,
}

enum Direction {
  None,
  All,
  Frontside,
  Backside,
}