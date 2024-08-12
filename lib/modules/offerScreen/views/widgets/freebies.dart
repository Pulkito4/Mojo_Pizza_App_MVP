import 'package:flutter/material.dart';

import 'code_copied_snack_bar.dart';
// import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/umbrella.dart';

class Freebies extends StatelessWidget {
  const Freebies({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Freebies",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              /* Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Umbrella())); */
            },
            child: Container(
              alignment: Alignment.centerLeft,
              // decoration: BoxDecoration(color: Colors.yellow),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/freebies_umbrella.jpg',
                    height: 100,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Free Umbrella worth ₹300",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Text(
                          "Valid once/user",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              CodeCopiedSnackBar.getSnackBar(),
                            );
                          },
                          child: Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.05,
                            color: Colors.grey[200],
                            child: const Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "COPY CODE : UMBRELLA",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(
                                        Icons.copy,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: screenSize.width * 0.15,
                  // ),
                  // Container(
                  //   // color: Colors.black,
                  //   alignment: Alignment.centerRight,
                  //   child: const Icon(
                  //     Icons.arrow_forward_ios,
                  //     size: 20,
                  //     color: Colors.grey,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          const Divider(
            height: 10,
            color: Color.fromARGB(255, 209, 208, 208),
          )
        ],
      ),
    );
  }
}
