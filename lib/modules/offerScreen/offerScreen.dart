import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/freebies.dart';

class Offerscreen extends StatefulWidget {
  const Offerscreen({super.key});

  @override
  State<Offerscreen> createState() => _OfferscreenState();
}

class _OfferscreenState extends State<Offerscreen> {
  List offer_screens = [];
  bool isTapped = false;

  void onTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DEALS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Divider(
            height: 5,
            color: Colors.grey[400],
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Freebies();
                    onTap();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTapped
                        ? Color.fromARGB(255, 255, 123, 0)
                        : Color.fromARGB(
                            255, 223, 227, 230), // Background color
                    foregroundColor: isTapped
                        ? Colors.white
                        : Color.fromARGB(115, 0, 0, 0), // Foreground color
                  ),
                  child: Text("Freebies")),
              // ElevatedButton(
              //     onPressed: onTap,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: isTapped
              //           ? Color.fromARGB(255, 255, 123, 0)
              //           : Color.fromARGB(
              //               255, 223, 227, 230), // Background color
              //       foregroundColor: isTapped
              //           ? Colors.white
              //           : Color.fromARGB(115, 0, 0, 0), // Foreground color
              //     ),
              //     child: Text("Freebies")),
              // ElevatedButton(
              //     onPressed: onTap,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: isTapped
              //           ? Color.fromARGB(255, 255, 123, 0)
              //           : Color.fromARGB(
              //               255, 223, 227, 230), // Background color
              //       foregroundColor: isTapped
              //           ? Colors.white
              //           : Color.fromARGB(115, 0, 0, 0), // Foreground color
              //     ),
              //     child: Text("Flat OFF")),
            ],
          )
        ],
      ),
    );
  }
}
