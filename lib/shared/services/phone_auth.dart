import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../modules/sign_up/views/pages/otp_screen.dart';

class PhoneAuth {
Future<void> signInWithPhoneNumber(String phoneNumber, String smsCode, context) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  // Verify phone number
  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
      // Handle successful authentication
    },
    verificationFailed: (FirebaseAuthException e) {
      // Handle error
      print(e.message);
    },
    codeSent: (String verId, int? resendToken) {
      verificationId = verId;
      Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: phoneNumber),),);
    },
    codeAutoRetrievalTimeout: (String verId) {
      verificationId = verId;
    },
  );

  // Ensure verificationId is not null
  if (verificationId != null) {
    // Sign in with the verification code
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      // Handle successful authentication
    } catch (e) {
      // Handle error
      print(e);
    }
  } else {
    // Handle the case where verificationId is null
    print('Verification ID is null');
  }
}}