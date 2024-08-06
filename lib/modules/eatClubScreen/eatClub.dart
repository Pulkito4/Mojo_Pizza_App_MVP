import 'package:flutter/material.dart';

class Eatclub extends StatefulWidget {
  const Eatclub({super.key});

  @override
  State<Eatclub> createState() => _EatclubState();
}

class _EatclubState extends State<Eatclub> {
  String? selectedOption = 'Free';
  String buttonText = 'Download EATCLUB';

  void RadioButtonChange(String? value) {
    setState(() {
      selectedOption = value;
      if (selectedOption == 'Free') {
        buttonText = 'Download EATCLUB';
      } else if (selectedOption == 'paid') {
        buttonText = 'Apply EATCLUB and Proceed';
      }
    });
  }

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
              top: screenSize.height * 0.18,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  // padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "SlashPass is now",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "EATCLUB",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/logos/wid1.png",
                              height: screenSize.height * 0.09,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Flexible(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Flat 30% OFF Everytime",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "No ifs & buts, 30% OFF means 30% OFF. No max discount cap. No minimum order.",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/logos/wid2.png",
                              height: screenSize.height * 0.09,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Flexible(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ZERO Delivery/Packaging Fees",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Just pay for what you eat. No Delivery, Packaging, or Surge Charges. No Fooling",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/logos/wid3.png",
                              height: screenSize.height * 0.09,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Flexible(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Handpicked Brands ONLY",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Select from our curated list. No more scrolling endlessly through restaurant listings, ratings & reviews",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Renew Your Membership",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150, // Width of the line
                        height: 2, // Height of the line (thickness)
                        color: Colors.black, // Color of the line
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => RadioButtonChange('Free'),
                            child: Container(
                                padding: EdgeInsets.zero,
                                width: screenSize.width * 0.4,
                                height: screenSize.height * 0.17,
                                decoration: BoxDecoration(
                                    color: selectedOption == 'Free'
                                        ? const Color.fromARGB(
                                            255, 222, 221, 221)
                                        : Colors.transparent,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: Radio<String>(
                                            value: 'Free',
                                            groupValue: selectedOption,
                                            onChanged: RadioButtonChange),
                                      ),
                                    ),
                                    Text(
                                      "FREE",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color:
                                              Color.fromARGB(255, 24, 207, 201),
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text("Trial"),
                                    Text(
                                      "6 Months",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      height: screenSize.height * 0.04,
                                      width: screenSize.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.black,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Only On",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            "EATCLUB App",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: () => RadioButtonChange('paid'),
                            child: Container(
                                padding: EdgeInsets.zero,
                                width: screenSize.width * 0.4,
                                height: screenSize.height * 0.17,
                                decoration: BoxDecoration(
                                    color: selectedOption == 'paid'
                                        ? const Color.fromARGB(
                                            255, 222, 221, 221)
                                        : Colors.transparent,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: Radio<String>(
                                            value: 'paid',
                                            groupValue: selectedOption,
                                            onChanged: RadioButtonChange),
                                      ),
                                    ),
                                    Text(
                                      "₹49",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "₹399",
                                      style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      "12 Months",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Container(
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.05,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            child: Text(
                              buttonText,
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Benefits On All Partner Brands",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Wrap(
                          spacing: screenSize.width * 0.05,
                          runSpacing: screenSize.height * 0.02,
                          children: [
                            Image.asset(
                              'assets/logos/v11.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v12.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v13.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v21.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v22.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v23.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v31.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v32.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v33.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v41.png',
                              width: screenSize.width * 0.25,
                            ),
                            Image.asset(
                              'assets/logos/v42.png',
                              width: screenSize.width * 0.25,
                            ),
                          ]),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Container(
                        height: screenSize.height * 0.15,
                        width: screenSize.width * 1,
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Avail Benefits on Partner Brands",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.05,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  child: Text(
                                    "Install EATCLUB",
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                          ],
                        ),
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
