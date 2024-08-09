import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/create_account_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/enter_phone.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/otp_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../../shared/services/google_oauth.dart';
import '../../../../shared/services/phone_auth.dart';
import '../../../home/views/pages/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _phoneController =
      TextEditingController(text: "+91");

  final GoogleOauth _auth = GoogleOauth();
  //final PhoneAuth _phoneAuth = PhoneAuth();

  _signInWithGoogle(BuildContext context) async {
    try {
      UserCredential userCred = await _auth.signInWithGoogle();
      print("USER CREDENTIAL: $userCred");
      if (userCred.user != null) {
        String email = userCred.user!.email!;
        bool userExists = await _checkIfUserExists(email);
        if (!userExists) {
          await _addUserToFirestore(userCred);
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => EnterPhone(
                    onPhoneNumberEntered: (phoneNumber) async {
                      await _updateUserPhoneNumber(
                          userCred.user!.email!, phoneNumber);
                    },
                  )), // Navigate to the next screen
        );
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  Future<void> _updateUserPhoneNumber(String email, String phoneNumber) async {
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

  Future<void> _addUserToFirestore(UserCredential userCred) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': userCred.user!.email,
      'name': userCred.user!.displayName,
      'password': "",
      'phone': userCred.user!.phoneNumber,
    });
  }

  Future<bool> _checkIfUserExists(String email) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  Future<bool> _checkIfPhoneExists(String phoneNumber) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phoneNumber)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  // _signInWithPhoneNumber(BuildContext context) async {
  //   try {
  //     await _phoneAuth.signInWithPhoneNumber(
  //         _phoneController.text, "", context);
  //     // Navigate to the next screen
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => CreateAccountScreen(
  //                 phoneNumber: _phoneController.text,
  //               )),
  //     );
  //   } catch (e) {
  //     print("Error signing in with phone number: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 126, 55),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 126, 55),
        body: Stack(
          children: [
            // Orange background with text
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const Text(
                      "Glad to meet you",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/images/signin.png"),
                    ),
                  ],
                ),
              ),
            ),

            // the white container thingy comming from the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Sign-in",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly,
                        //   LengthLimitingTextInputFormatter(
                        //     13,
                        //   ), // +91 (3 chars) + 10 digits
                        // ],
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onTap: () {
                          // Set the cursor position after +91
                          _phoneController.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: _phoneController.text.length),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          String phoneNumber = _phoneController.text.trim();
                          bool phoneExists =
                              await _checkIfPhoneExists(phoneNumber);
                          print(phoneExists);
                          // _signInWithPhoneNumber(context);
                          (phoneExists)
                              ? await FirebaseAuth.instance.verifyPhoneNumber(
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException ex) {},
                                  codeSent: (String verificationid,
                                      int? resendtoken) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OtpScreen(
                                                  verificationid:
                                                      verificationid,
                                                )));
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationid) {},
                                  phoneNumber: _phoneController.text.toString(),
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateAccountScreen(
                                            phoneNumber: _phoneController.text
                                                .toString(),
                                          )));
                        },
                        style: CustomButtonStyles.orangeButton,
                        child: const Text("Continue"),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            "OR",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      // Google sign in button
                      const SizedBox(height: 20),
                      SignInButton(
                        Buttons.google,
                        onPressed: () {
                          _signInWithGoogle(context);
                        },
                        shape: const BeveledRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "By signing in, you agree to the ",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 116, 115, 115)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
