import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Future<void> updateUserPhoneNumber(String email, String phoneNumber) async {
    // find the user in firestore using email // get the document id
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    // if user exists, update the phone number
    if (result.docs.isNotEmpty) {
      final docId = result.docs.first.id;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(docId)
          .update({'phone': phoneNumber});
    }
  }

  Future<void> addUserToFirestore(
      {required String email,
      required String name,
      String password = "",
      String phone = ""}) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
    });
  }

  Future<bool> checkIfUserExists(String email) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  Future<bool> checkIfPhoneExists(String phoneNumber) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phoneNumber)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }
}
