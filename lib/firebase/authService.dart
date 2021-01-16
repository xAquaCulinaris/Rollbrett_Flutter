import 'package:firebase_auth/firebase_auth.dart';
import 'package:rollbrett_rottweil/Class/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _convertUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  /* Future signIn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      print(e.toString());
      print("Login failed");
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      print("Error logging out");
      return null;
    }
  }

  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      print(e.toString());
      print("Register failed");
      return null;
    }
  }

  //Firebase auth change and convert firebase user to normal user
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_convertUser);
  }
}
