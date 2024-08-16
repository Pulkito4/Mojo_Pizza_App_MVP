import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String data;
  const BulletPoint({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.circle,
              size: 7,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
                child: Text(
              data,
              style: const TextStyle(color: Colors.grey),
            ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          height: 1,
          color: Color.fromARGB(255, 227, 224, 224),
        )
      ],
    );
  }
}
