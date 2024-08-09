import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../custom_button_styles.dart';
import '../../../../shared/services/phone_auth.dart';

class OtpScreen extends StatefulWidget {
    final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _otpController = TextEditingController();
  PhoneAuth _phoneAuth = PhoneAuth();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                        "Enter OTP",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("OTP has been sent on +${widget.phoneNumber}"),
                      const SizedBox(height: 20),
                       PinCodeTextField(
              controller: _otpController,
              appContext: context,
              length: 6,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              // onCompleted: (v) {
              //   print("Completed: $v");
              // },
              // onChanged: (value) {
              //   print(value);
              // },
              // beforeTextPaste: (text) {
              //   return true;
              // },
            ),
                      const SizedBox(height: 20),
                   ElevatedButton(
                        onPressed: () async {
                          // if all ok then go to home screen
                          String otp = _otpController.text.trim();
                          if (otp.length != 6) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a valid OTP"),
                              ),
                            );
                            return;
                          }
                           await _phoneAuth.signInWithPhoneNumber(widget.phoneNumber, otp, context);
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