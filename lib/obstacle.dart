

class Obstacle {
  final String name;
  final String image;
  bool inRange;
  final int width;
  final int height;
  final String difficulty;

  static List<Obstacle> _obstacleList = [
    Obstacle("Hubba", "assets/decenzo_rail.jpg", true, 50, 50, "Medium"),
    Obstacle("Rail", "assets/decenzo_rail.jpg", true, 50, 50, "Medium"),
    Obstacle("Ledge", "assets/decenzo_rail.jpg", true, 50, 50, "Easy"),
  ];

  static List<Obstacle> getObstacles() {
    return _obstacleList;
  }



  Obstacle(this.name, this.image, this.inRange, this.width, this.height, this.difficulty);



}

