import 'package:flutter/material.dart';

class Textui extends StatelessWidget {
  final String txt;
  const Textui({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenText = screenWidth * 0.5;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          txt,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: screenText * 0.1,
            color: Colors.grey[850],
          ),
        ),
      ),
    );
  }
}
