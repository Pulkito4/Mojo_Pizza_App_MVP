import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../modules/sign_up/views/pages/otp_screen.dart';

// NOTE THAT THIS FILE's CODE IS NOT BEING USED ANYWHERE IN THE PROJECT DUE TO COUNTRY CODE HANDLING ISSUES WITH PHONE AUTHENTICATION/ TEXT CONTROLLERS
class PhoneAuth {
  final TextEditingController? _phoneController;
  late final String _phoneNumber;

  PhoneAuth(this._phoneController) {
    _phoneNumber = _phoneController!.text.toString();
  }
  PhoneAuth.withPhoneNumber(this._phoneNumber) : _phoneController = null;

  Future<void> signInWithPhoneNumber(BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          print("Verification failed: ${ex.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationid: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        // phoneNumber: _phoneController.text.toString(),
        phoneNumber: _phoneNumber,
      );
    } catch (e) {
      print("Error signing in with phone number: $e");
    }
  }

  void updatePhoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    // Add any additional logic needed when the phone number is updated
  }
}
