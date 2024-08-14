import 'package:flutter/material.dart';

class SavedCards extends StatelessWidget {
  const SavedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "SAVED CARDS",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(child: Image.asset('assets/logos/saved_cards.jpg')),
      ),
    );
  }
}
