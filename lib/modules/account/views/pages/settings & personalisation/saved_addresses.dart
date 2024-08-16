import 'package:flutter/material.dart';

class SavedAddresses extends StatelessWidget {
  const SavedAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "ADDRESS LIST",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Divider(
              height: 5,
            )),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 255, 123, 0),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Add a New Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 255, 123, 0),
                  ),
                ),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 234, 233, 233),
            )
          ],
        ),
      ),
    ));
  }
}
