import 'package:flutter/material.dart';

class SavedUpiIds extends StatelessWidget {
  const SavedUpiIds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "SAVED UPI IDs",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(child: Image.asset('assets/logos/saved_upi_ids.jpg')),
      ),
    );
  }
}
