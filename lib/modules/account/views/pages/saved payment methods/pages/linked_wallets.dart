import 'package:flutter/material.dart';

class LinkedWallets extends StatelessWidget {
  const LinkedWallets({super.key});

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
          "LINKED WALLETS",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              
              children: 
              [
                Image.asset(
                  'assets/logos/download.png',
                  scale: 8,
                ),
                Text(
                  "   Amazon Pay Balance",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Text("LINK", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Color.fromARGB(255, 22, 19, 198)),)
            
          ],
        ),
      ),
    );
  }
}
