import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rollbrett_rottweil/Class/post.dart';
import 'package:rollbrett_rottweil/Class/user.dart';

class DatabaseServicePosts {
  final String uid;
  final CollectionReference collection = Firestore.instance.collection('posts');

  DatabaseServicePosts({this.uid});

  //get posts
  Stream<List<Post>> get users {
    return collection.reference().snapshots().map(_postListConverter);
  }

  List<Post> _postListConverter(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Post(doc.data['name'] ?? '', doc.data['uid'] ?? '');
    }).toList();
  }

  //create Post OR update  ist data if already exists
  Future updateUserData(String name) async {
    print("added user?");
    return await collection.document(uid).setData({
      'name': name,
    });
  }
}