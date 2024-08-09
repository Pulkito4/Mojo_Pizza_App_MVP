import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../custom_button_styles.dart';
import 'otp_screen.dart';

class EnterPhone extends StatefulWidget {
  final Function(String) onPhoneNumberEntered;
  const EnterPhone({super.key, required this.onPhoneNumberEntered});

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  final TextEditingController _phoneController = TextEditingController();

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
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const Text(
                      "",
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
                        "Enter Phone Number",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("you want the OTP to be sent on"),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Phone",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          String phoneNumber = _phoneController.text;
                          widget.onPhoneNumberEntered(phoneNumber);
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException ex) {},
                            codeSent:
                                (String verificationid, int? resendtoken) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                            verificationid: verificationid,
                                          )));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationid) {},
                            phoneNumber: _phoneController.text.toString(),
                          );
                          // Navigate to the next screen
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => OtpScreen(
                          //             phoneNumber: widget.phoneNumber,
                          //           )),
                          // );
                        },
                        style: CustomButtonStyles.orangeButton,
                        child: const Text("Continue"),
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
