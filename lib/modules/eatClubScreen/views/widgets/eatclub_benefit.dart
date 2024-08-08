import 'package:flutter/material.dart';

class EatclubBenefit extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const EatclubBenefit({
    super.key,
    required this.screenSize,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: screenSize.height * 0.09,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
