import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Umbrella extends StatelessWidget {
  const Umbrella({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
        Positioned.fill(
            child: Image.asset(
          'assets/images/umbrella_bg.jpg',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            top: screenSize.height * 0.18,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/freebies_umbrella.jpg',
                                height: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Free Umbrella worth ₹300",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Valid once/user",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(
                                  //       SnackBar(
                                  //         content: Center(
                                  //             child: Text('Code Copied!')),
                                  //         duration: Duration(seconds: 2),
                                  //         behavior: SnackBarBehavior.floating,
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(10.0)),
                                  //         backgroundColor: Color.fromARGB(
                                  //             255, 142, 142, 142),
                                  //       ),
                                  //     );
                                  //   },
                                  //   child: Container(
                                  //     width: screenSize.width * 0.5,
                                  //     height: screenSize.height * 0.025,
                                  //     color: Colors.grey[200],
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceEvenly,
                                  //       children: [
                                  //         Text(
                                  //           "COPY CODE : UMBRELLA",
                                  //           style: TextStyle(
                                  //               color: Colors.green,
                                  //               fontWeight: FontWeight.bold),
                                  //         ),
                                  //         Icon(
                                  //           Icons.copy,
                                  //           color: Colors.green,
                                  //           size: 15,
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                width: screenSize.width * 0.15,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: const Color.fromARGB(255, 209, 208, 208),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Text("Valid for : All Users"),
                            SizedBox(
                              width: screenSize.width * 0.15,
                            ),
                            Icon(Icons.label),
                            Text("Min Order : ₹100")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: DottedBorder(
                            strokeWidth: 2,
                            dashPattern: [6, 3],
                            color: Colors.grey,
                            child: Container(
                              width: screenSize.width * 0.31,
                              height: screenSize.height * 0.05,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.copy_rounded,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Umbrella",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 10,
                          color: const Color.fromARGB(255, 209, 208, 208),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Steps To Redeem",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text("1. Click on Order Now"),
                              Text("2. Add Items on your Cart"),
                              Text("3. Click on Apply Promo Code"),
                              Text("4. Choose UMBRELLA from the options"),
                              Text("5. Click on Make Payment"),
                              Text(
                                  "6. Choose your payment option and complete yout purchase"),
                              Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text("1. Offer is applicable only once/user"),
                              Text(
                                  "2. This offer canno be clubbed with any other offer"),
                              Text(
                                  "3. Offer is applicable only on orders via EatClub App/ Web"),
                              Text("4. Offer Valid till stock lasts")
                            ],
                          ),
                        ),
                        Stack(
                          children : [Positioned(
                            bottom: 0,
                            child: Container(
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
                                    "ORDER NOW",
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                          ),]
                        ),
                      ],
                    ),
                  ),
                ))),
      ]),
    );
  }
}
