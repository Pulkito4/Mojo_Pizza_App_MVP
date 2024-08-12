import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService{


  Future<void> updateUserPhoneNumber(String email, String phoneNumber) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    if (result.docs.isNotEmpty) {
      final docId = result.docs.first.id;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(docId)
          .update({'phone': phoneNumber});
    }
  }


  // Future<void> addUserToFirestore(UserCredential userCred) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'email': userCred.user!.email,
  //     'name': userCred.user!.displayName,
  //     'password': "",
  //     'phone': userCred.user!.phoneNumber,
  //   });
  // }

   Future<void> addUserToFirestore({required String email,required  String name, String password ="", String phone=""}) async {
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