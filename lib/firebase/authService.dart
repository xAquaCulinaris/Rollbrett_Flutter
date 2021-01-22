import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static String userID;

  //Firebase auth changed and convert firebase user to normal user
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_convertUser);
  }

  User _convertUser(FirebaseUser user) {
    if (user != null) {
      userID = user.uid;
      return User(user.uid);
    }
    return null;

    //  return user != null ? User(user.uid) : null;
  }

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

  Future register(String email, String password, String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await UserService(user.uid, username).updateUserData(username);
      return _convertUser(user);
    } catch (signUpError) {
      return Future.error("Error", StackTrace.fromString("User with this email already exists"));
    }
  }
}
