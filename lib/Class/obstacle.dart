class Obstacle {
  final String name;
  final String image;
  bool inRange;
  final int width;
  final int height;
  final String difficulty;

  static final Obstacle _rail = Obstacle("Rail", "assets/rail.jpg", false, 50, 50, "Medium");
  static final Obstacle _hubba = Obstacle("Hubba", "assets/hubba.jpg", false, 50, 50, "Medium");
  static final Obstacle _ledge = Obstacle("Ledge", "assets/ledge.jpg", true, 50, 50, "Easy");
  static final Obstacle _stair = Obstacle("Stair", "assets/stair.jpeg", false, 50, 50, "Medium");

  static List<Obstacle> _obstacleList = [
    _hubba,
    _rail,
    _ledge,
    _stair,
  ];

  static List<Obstacle> getObstacles() {
    return _obstacleList;
  }

  static Obstacle getRail() {
    return _rail;
  }

  static Obstacle getHubba() {
    return _hubba;
  }

  static Obstacle getLedge() {
    return _ledge;
  }

  static Obstacle getStair() {
    return _stair;
  }



  Obstacle(this.name, this.image, this.inRange, this.width, this.height, this.difficulty);



}

