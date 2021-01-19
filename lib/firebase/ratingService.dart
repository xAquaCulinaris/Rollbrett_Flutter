import 'package:cloud_firestore/cloud_firestore.dart';


class RatingService {
  final CollectionReference collection = Firestore.instance.collection(
      'ratings');


  static String getRatingID(String username, String postID) {
    return username + '_' + postID;
  }

  static Future<int> getRating(String username, String postID) async {
    int rating = 0;

    await Firestore.instance.collection('ratings')
        .where(FieldPath.documentId, isEqualTo: getRatingID(username, postID))
        .getDocuments()
        .then((event) {
      if (event.documents.isNotEmpty) {
        Map<String, dynamic> documentData = event.documents.single.data;
        print("rating return");
        rating =  documentData['rating'];
      }
    }).catchError((error) {
      print("Document dont exists: $error");
    });
    return rating;
  }
}