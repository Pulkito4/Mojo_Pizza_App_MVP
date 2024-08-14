import 'package:flutter/material.dart';

import '../widgets/eatclub_benefit.dart';

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
      selectedOption = value!;
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/images/eatclub.jpg',
            )),
            Positioned.fill(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
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
              child: Row(
                children: [
                  SizedBox(
                      width: screenSize.width * 0.6,
                      child: const Text(
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
                          borderRadius: BorderRadius.circular(10), // Button shape
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                      ),
                      child: const Text(
                        "Install EATCLUB",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "SlashPass is now",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "EATCLUB",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        EatclubBenefit(
                            screenSize: screenSize,
                            imagePath: "assets/logos/wid1.png",
                            title: "Flat 30% OFF Everytime",
                            description:
                                "No ifs & buts, 30% OFF means 30% OFF. No max discount cap. No minimum order."),
                        const SizedBox(
                          height: 20,
                        ),
                        EatclubBenefit(
                            screenSize: screenSize,
                            imagePath: "assets/logos/wid2.png",
                            title: "ZERO Delivery/Packaging Fees",
                            description:
                                "Just pay for what you eat. No Delivery, Packaging, or Surge Charges. No Fooling"),
                        const SizedBox(
                          height: 20,
                        ),
                        EatclubBenefit(
                            screenSize: screenSize,
                            imagePath: "assets/logos/wid3.png",
                            title: "Exclusive Offers",
                            description:
                                "Get access to exclusive offers on top of the 30% OFF. No hidden terms & conditions"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Renew Your Membership",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150, // Width of the line
                          height: 2, // Height of the line (thickness)
                          color: Colors.black, // Color of the line
                        ),
                        const SizedBox(
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
                                      const Text(
                                        "FREE",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 24, 207, 201),
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const Text("Trial"),
                                      const Text(
                                        "6 Months",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: screenSize.height * 0.04,
                                          width: screenSize.width * 0.4,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10)),
                                            color: Colors.black,
                                          ),
                                          child: const Column(
                                            children: [
                                              Text(
                                                "Only On",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "EATCLUB App",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w900),
                                                ),
                                              )
                                            ],
                                          ),
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
                                      const Text(
                                        "₹49",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const Text(
                                        "₹399",
                                        style: TextStyle(
                                          fontSize: 20,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const Text(
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
                        SizedBox(
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
                                style: const TextStyle(fontSize: 16),
                              )),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Benefits On All Partner Brands",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
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
                              const Text(
                                "Avail Benefits on Partner Brands",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
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
                                    child: const Text(
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
      ),
    );
  }
}
