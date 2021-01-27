import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:uuid/uuid.dart';

class PostService {
  final String uid;
  static final CollectionReference collection = Firestore.instance.collection('posts');

  PostService({this.uid});

  //get posts
  Stream<List<Post>> get posts {
    return collection.reference().snapshots().map(_postListConverter);
  }

  List<Post> _postListConverter(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Post(doc.data['name'] ?? '', doc.data['uid'] ?? '', doc.data['video'] ?? '', doc.documentID);
    }).toList();
  }

  static Post _convertPost(Map<String, dynamic> map, String postID) {
    return Post(map['name'], map['uid'], map['video'], postID);
  }
  
  static Future<Post> getPostFromID(String id) async {
    DocumentSnapshot snapshot =
        await Firestore.instance.document("posts/$id").get();

    return _convertPost(snapshot.data, id);
  }

  //create Post OR update  ist data if already exists
  static Future updatePostData() async {
    var uuid = Uuid();

    return await collection.document(uuid.v4()).setData(
      {
        'name': 'test',
        'uid': 'Mnza2qZ9hgb35HLVXf8Y3e1QDNu1',
        'video':
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
      },
    );
  }
}
