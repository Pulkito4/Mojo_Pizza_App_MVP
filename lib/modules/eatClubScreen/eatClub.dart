import 'package:flutter/material.dart';

class Eatclub extends StatefulWidget {
  const Eatclub({super.key});

  @override
  State<Eatclub> createState() => _EatclubState();
}

class _EatclubState extends State<Eatclub> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/eatclub.jpg',
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30), // Rounded top edges
                  ),
                  child: Image.asset(
                    'assets/images/tifanny_bg_eatclub.jpg',
                    height: screenSize.height * 0.9,
                    width: screenSize.width,
                    fit: BoxFit.cover,
                  ))),
          Positioned(
              top: screenSize.height * 0.11,
              left: screenSize.width * 0.05,
              child: Container(
                  child: Row(
                children: [
                  Container(
                      width: screenSize.width * 0.6,
                      child: Text(
                        "Avail benefits on Partner Brands",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Button shape
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), 
                      ),
                      child: Text(
                        "Install EATCLUB",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 15),
                      ))
                ],
              ))),
          Positioned.fill(
            top: screenSize.height*0.18,
            
            child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("SlashPass is now",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text("EATCLUB",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: screenSize.height*0.05,
                  ),
                  Row(
                    children: [],
                  )

                  
                  ],
              ),
            ),
          ))

        ],
      ),
    );
  }
}
