import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UserServiceTest {
  static final CollectionReference _collection = Firestore.instance.collection('users');


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


}