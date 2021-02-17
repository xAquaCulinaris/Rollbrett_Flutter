import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rollbrett_rottweil/Class/user.dart';

class UserServiceTest {
  static final CollectionReference _collection =
      Firestore.instance.collection('users');

  static Future<String> getProfilePicture(String uid) async {
    String imageUrl;
    await _collection
        .where(FieldPath.documentId, isEqualTo: uid)
        .getDocuments()
        .then((event) {
      if (event.documents.isNotEmpty) {
        Map<String, dynamic> documentData = event.documents.single.data;
        imageUrl = documentData['profilePic'];
      }
    }).catchError((error) {
      print("Document dont exists: $error");
    });
    return imageUrl;
  }

  static Future<bool> userNameExists(String name) async {
    return (await _collection.where("name", isEqualTo: name).getDocuments()).documents.length > 0;
  }


  static User _convertUser(Map<String, dynamic> map) {
    return User(uid: map["uid"], name: map["name"], profilePicture: map['profilePic']);
  }


  static Future<User> getUser(String uid) async {
    DocumentSnapshot snapshot =
        await Firestore.instance.document("users/$uid").get();

    return _convertUser(snapshot.data);
  }

  static void updatePassword(String uid, String pass) async {

  }

  //update rating for the current post and current user
  static void updateUser(String uid, String name, String profilePic) async {
    _collection.document(uid).setData({'name': name, 'profilePic': profilePic});
  }


}
