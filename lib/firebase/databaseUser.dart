import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceUser {
  final String uid;
  final String username;

  DatabaseServiceUser(this.uid, this.username);

  final CollectionReference collection = Firestore.instance.collection('users');

  //create user OR update his data if he already exists
  Future updateUserData(String name) async {
    print("added user?");
    return await collection.document(uid).setData({
      'name': name,
    });
  }
}
