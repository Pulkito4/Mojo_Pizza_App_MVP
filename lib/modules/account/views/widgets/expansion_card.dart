import 'package:flutter/material.dart';

class ExpansionCard extends StatelessWidget {
  final String heading;
  final String details;
  const ExpansionCard(
      {super.key, required this.heading, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            heading,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Text(
                  details,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 97, 97, 97), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
