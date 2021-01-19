class Post {
  final String uid;
  final String username;
  final String image;
  final String video;
  final String postID;
  int likes = 0;
  int dislikes = 0;

  Post(this.username, this.uid, this.image, this.video, this.postID);


}