import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/account_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/home/views/pages/home_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/homescreen/pages/homescreen.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/sign_up_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                SignUpScreen()), // Replace with your next screen
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}