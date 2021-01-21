import 'package:cloud_firestore/cloud_firestore.dart';

class RatingService {
  static CollectionReference collection =
      Firestore.instance.collection('ratings');


  //return name of the document
  static String getRatingID(String userID, String postID) {
    return userID + '_' + postID;
  }

  //update rating for the current post and current user
  static Future setRating(String userID, String postID, int rating) async {
    collection.document(getRatingID(userID, postID)).setData({'userID': userID, 'postID': postID, 'rating': rating});

   //collection.document(getRatingID(userID, postID)).updateData({'rating': rating});
  }

  //get the rating as integer for the current post and current user
  static Future<int> getRating(String userID, String postID) async {
    int rating = 0;

    await collection
        .where(FieldPath.documentId, isEqualTo: getRatingID(userID, postID))
        .getDocuments()
        .then((event) {
      if (event.documents.isNotEmpty) {
        Map<String, dynamic> documentData = event.documents.single.data;
        print("rating return");
        rating = documentData['rating'];
      }
    }).catchError((error) {
      print("Document dont exists: $error");
    });
    return rating;
  }
}
