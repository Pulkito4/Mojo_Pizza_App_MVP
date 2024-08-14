import 'package:flutter/material.dart';

class SavedAddresses extends StatefulWidget {
  const SavedAddresses({super.key});

  @override
  State<SavedAddresses> createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<SavedAddresses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "ADDRESS LIST",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Divider(
              height: 5,
            )),
      ),
      body: Padding(
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
            Divider(color: Color.fromARGB(255, 234, 233, 233),)
          ],
        ),
      ),
    ));
  }
}
