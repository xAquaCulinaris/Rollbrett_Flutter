import 'package:firebase_auth/firebase_auth.dart';
import 'package:rollbrett_rottweil/Class/user.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _getUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid): null;
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _getUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


}