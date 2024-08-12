import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String customHintText;
  const CustomTextField({super.key, required this.customHintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          hintText: customHintText,
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }
}
