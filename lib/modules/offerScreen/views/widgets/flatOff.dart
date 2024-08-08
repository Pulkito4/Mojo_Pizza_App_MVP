import 'package:flutter/material.dart';

import 'code_copied_snack_bar.dart';

class Flatoff extends StatelessWidget {
  const Flatoff({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Flat OFF",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: screenSize.width * 0.05,
            runSpacing: screenSize.height * 0.02,
            children: [
              // Image.asset('assets/images/off(1).jpg')
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CodeCopiedSnackBar.getSnackBar(),
                  );
                },
                child: Image.asset(
                  'assets/images/off (1).jpg',
                  height: screenSize.height * 0.25,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CodeCopiedSnackBar.getSnackBar(),
                  );
                },
                child: Image.asset(
                  'assets/images/delivery(2).jpg',
                  height: screenSize.height * 0.25,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CodeCopiedSnackBar.getSnackBar(),
                  );
                },
                child: Image.asset(
                  'assets/images/chocolava(3).jpg',
                  height: screenSize.height * 0.25,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
