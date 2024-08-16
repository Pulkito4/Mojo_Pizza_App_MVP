import 'package:flutter/material.dart';

import 'textui.dart';

class Paybtn extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;
  const Paybtn({
    super.key,
    required this.method,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenText = screenWidth * 0.5;

    return Column(
      children: [
        Textui(txt: method),
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 255, 153, 0),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          child: SizedBox(
            height: screenHeight * 0.08,
            width: screenWidth * 0.85,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Make Payment",
                style:
                    TextStyle(color: Colors.white, fontSize: screenText * 0.1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
