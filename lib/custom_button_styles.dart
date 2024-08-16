import 'package:flutter/material.dart';

class CustomButtonStyles {
  static final ButtonStyle orangeButton = ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 255, 123, 0),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ));
}
