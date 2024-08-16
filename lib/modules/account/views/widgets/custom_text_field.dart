import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String customHintText;
  const CustomTextField({super.key, required this.customHintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: customHintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
