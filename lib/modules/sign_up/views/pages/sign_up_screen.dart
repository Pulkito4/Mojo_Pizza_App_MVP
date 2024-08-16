import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/create_account_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/otp_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../../shared/services/firestore_service.dart';
import '../../bloc/user_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _phoneController =
      TextEditingController(text: "+91");

  final FirestoreService _firestoreService = FirestoreService();

  _signInWithGoogle(BuildContext context) async {
    BlocProvider.of<UserBloc>(context).add(LoginEvent(context));
  }

  _signInWithPhoneNumber(BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {},
        codeSent: (String verificationid, int? resendtoken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        verificationid: verificationid,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationid) {},
        phoneNumber: _phoneController.text.toString(),
      );
    } catch (e) {
      print("Error signing in with phone number: $e");
    }
  }

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
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Phone Number (with country code)",
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

                          // check if the phone number exists in the database
                          bool phoneExists = await _firestoreService
                              .checkIfPhoneExists(phoneNumber);

                          // if phone exists then sign in with phone number
                          (phoneExists)
                              ? _signInWithPhoneNumber(context)

                              // if phone does not exist then create account
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
