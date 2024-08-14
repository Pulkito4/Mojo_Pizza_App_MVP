import 'package:flutter/material.dart';

class ExpansionCard extends StatefulWidget {
  final String heading;
  final String details;
  const ExpansionCard({super.key, required this.heading, required this.details});

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            widget.heading, 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
         
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Text(
                  widget.details,
                  style: TextStyle(color: const Color.fromARGB(255, 97, 97, 97), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
