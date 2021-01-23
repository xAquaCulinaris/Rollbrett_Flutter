import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class userServiceTest {
  static final CollectionReference collection = Firestore.instance.collection('users');


  static Future<String> getProfilePicture(String uid) async {
    String imageUrl;
    await collection
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



}