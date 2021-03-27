import 'package:flutter/cupertino.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<String> getImageFromUID(String uid) async {
    return await UserService.getProfilePicture(uid);
  }
}
