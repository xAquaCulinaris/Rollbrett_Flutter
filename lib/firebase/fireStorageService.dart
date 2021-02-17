import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rollbrett_rottweil/firebase/userServiceTest.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();




  static Future<String> getImageFromUID(String uid) async {
    return await UserServiceTest.getProfilePicture(uid);
  }


}
