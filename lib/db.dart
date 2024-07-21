import 'package:cloud_firestore/cloud_firestore.dart';

String collectionPath = 'Users';

Future<void> updateFirestoreDoc(userId) async {
  try {
    await FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(userId)
        .set({'is_processing': true}, SetOptions(merge: true));
  } catch (error) {
    print('Error updating Firestore: $error');
  }
}

Stream<DocumentSnapshot<Map<String, dynamic>>> getFirestoreDoc(userId) {
  return FirebaseFirestore.instance
      .collection(collectionPath)
      .doc(userId)
      .snapshots();
}