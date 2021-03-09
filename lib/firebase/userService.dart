import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final String uid;
  final String username;
  final String profilePic;
  final String stance;

  UserService(this.uid, this.username, this.profilePic, this.stance);

  final CollectionReference collection = Firestore.instance.collection('users');

  //create user OR update his data if he already exists
  Future updateUserData(String name) async {
    return await collection.document(uid).setData({'name': name, 'uid': uid, 'profilePic': profilePic, 'stance': stance});
  }
}
