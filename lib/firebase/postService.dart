import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      return Post(doc.data['uid'] ?? '', doc.data['video'] ?? '', doc.documentID, doc.data['thumbnail'], doc.data['caption']);
    }).toList();
  }

  static Future<List<Post>> getAllPostFromUser(String uid) async {
    var result = (await collection.where('uid', isEqualTo: uid).getDocuments()).documents;
    List<Post> converted = [];
    for (int i = 0; i < result.length; i++) {
      converted.add(_convertPost(result[i].data, result[i].documentID));
      print("postIDs:" + _convertPost(result[i].data, result[i].documentID).postID);
    }
    print("lenght: " + converted.length.toString());
    return converted;
  }

  static Post _convertPost(Map<String, dynamic> map, String postID) {
    return Post(map['uid'], map['video'], postID, map['thumbnail'], map['caption']);
  }

  static Future<Post> getPostFromID(String id) async {
    DocumentSnapshot snapshot = await Firestore.instance.document("posts/$id").get();

    return _convertPost(snapshot.data, id);
  }

  static Future<String> uploadThumbnail(File _image) async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('thumbnails/' + Uuid().v4());
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    String url = await storageReference.getDownloadURL();
    return url;
  }

  //create Post OR update data if already exists
  static Future updatePostData(String thumbnailUrl, String uid, String caption) async {
    var uuid = Uuid();

    return await collection.document(uuid.v4()).setData(
      {'uid': uid, 'video': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', 'thumbnail': thumbnailUrl, 'caption': caption},
    );
  }

  static Future<void> deletePost(String postID) async {
    deleteRatings(postID);
    return collection.document(postID).delete();
  }

  static Future<void> deleteRatings(String postID) {
    return Firestore.instance.collection('ratings').getDocuments().then((value) {
      List<DocumentSnapshot> allDocs = value.documents;
      List<DocumentSnapshot> filteredDocs = allDocs.where((document) => document.data['postID'] == postID).toList();
      for (DocumentSnapshot ds in filteredDocs) {
        ds.reference.delete();
      }
    });
  }
}
