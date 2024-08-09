import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/otp_screen.dart';

import '../../../../custom_button_styles.dart';

class CreateAccountScreen extends StatefulWidget {
  final String phoneNumber;
  const CreateAccountScreen({super.key, required this.phoneNumber});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                      "Let's Start",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const Text(
                      "Tell us more about you",
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
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("Please fill the details for ${widget.phoneNumber}"),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "NAME",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "EMAIL",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          labelText: "PASSWORD",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
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
