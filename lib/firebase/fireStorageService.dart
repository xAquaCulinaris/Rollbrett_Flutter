import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rollbrett_rottweil/firebase/userServiceTest.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();




  static Future<String> getImageFromUID(String uid) async {
    String imageName = await userServiceTest.getProfilePicture(uid);
    return getImageUrl(imageName);
  }

  static Future<String> getImageUrl(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
