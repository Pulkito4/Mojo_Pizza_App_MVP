import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 123, 0),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 123, 0),
        body: Stack(
          children: [
            // Orange background with text
            const Padding(
              padding: EdgeInsets.only(left: 40, top: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    Text(
                      "Glad to meet you",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                      const TextField(
                          decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      )),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
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
                      const SizedBox(height: 20),
                      SignInButton(
                        Buttons.google,
                        onPressed: () {},
                        shape: const BeveledRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By signing in, you agree to the ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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