import 'package:firebase_auth/firebase_auth.dart';
import 'package:rollbrett_rottweil/Class/user.dart';
import 'package:rollbrett_rottweil/firebase/userService.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static String userID;

  //Firebase auth changed and convert firebase user to normal user
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_convertUser);
  }

  User _convertUser(FirebaseUser user) {
    if (user != null) {
      userID = user.uid;
      return User(uid: user.uid);
    }
    return null;

    //  return user != null ? User(user.uid) : null;
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      print(e.toString());
      print("Login failed");
      return null;
    }
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
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

  Future register(String email, String password, String username, String stance) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //TODO; add dynamic picture
      await UserService(user.uid, username,
              'https://firebasestorage.googleapis.com/v0/b/rollbrett-rottweil-flutter.appspot.com/o/thumbnails%2F1a817c2a-0291-4af6-af22-4904fa72c12c?alt=media&token=1dec4a49-b478-4807-94c1-301bcc7f1727', stance)
          .updateUserData(username);
      return _convertUser(user);
    } catch (signUpError) {
      return Future.error("Error", StackTrace.fromString("User with this email already exists"));
    }
  }
}
