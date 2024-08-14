import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/referral/widgets/refer_widgets.dart';
import 'package:mojo_pizza_app_mvp/modules/referral/widgets/stepscard.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({super.key});

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textSize = screenWidth * 0.05;

    return SafeArea(
      //os ki functionality se disturb nhi hoga
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //stack -> referral and video
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: screenHeight * 0.23,
                      width: screenWidth,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                                Text(
                                  "INDIA'S BIGGEST REFERRAL",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text("Earn ₹500 per friend",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 155, right: 20),
                    child: Container(
                      height: screenHeight * 0.20,
                      width: screenWidth * 2.5,
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/images/pizza2.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // midtext
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Generate Unique Referral Code",
                        style: GoogleFonts.firaSans(
                            fontSize: textSize,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(237, 32, 184, 174)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "To start referring, place your 1st order & get your referral code. Share it & earn 500 per referral ",
                          style: TextStyle(
                            fontSize: textSize * 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Ordernow(),
                      ElevatedButton(
                        onPressed: () {},
                        style: CustomButtonStyles.orangeButton.copyWith(
                          minimumSize: WidgetStatePropertyAll(
                            Size(
                              screenWidth * 0.9,
                              50,
                            ),
                          ),
                        ),
                        child: const Text("ORDER NOW"),
                      )
                    ]),
              ),

              // horizontal scroll bar
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: screenHeight * 0.17,
                width: screenWidth * 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ReferWidgets(
                        description:
                            "Kiran ordered fifteen times and got her 5 times dinner free",
                        imgpath: 'assets/images/gep.jpeg',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ReferWidgets(
                        description:
                            "A customer shared her referral on IG and ate free pizzaz for 2 months",
                        imgpath: "assets/images/pizza.jpg",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ReferWidgets(
                        description:
                            "She shares her referral code as Insta story and eats free food !!",
                        imgpath: "assets/images/gep4.jpeg",
                      ),
                    ],
                  ),
                ),
              ),

              // text
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "HOW TO EARN ₹500 PER FRIEND",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: textSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //steps for referral
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: screenHeight * 0.95,
                  width: screenWidth * 0.9,
                  child: const Column(
                    children: [
                      Stepscard(
                          stepnum: "STEP 1",
                          step: "Share your referral code on WhatsApp",
                          desc:
                              "Or simply click on copy & paste the message anywhere",
                          imgpath: "assets/images/s1.png"),
                      SizedBox(
                        height: 10,
                      ),
                      Stepscard(
                          stepnum: "STEP 2",
                          step: "Your friend uses your referral code.",
                          desc:
                              "They get a cool FLAT ₹200 OFF on first 3 orders.",
                          imgpath: "assets/images/s2.png"),
                      SizedBox(
                        height: 10,
                      ),
                      Stepscard(
                          stepnum: "STEP 3",
                          step: "You get Rs 500 Credits per friend.",
                          desc:
                              "Credits worth 50% of your friend's total bill, evevrytime they order, till you earn Rs 500 credits per friend",
                          imgpath: "assets/images/s3.png"),
                      SizedBox(
                        height: 10,
                      ),
                      Stepscard(
                          stepnum: "EXAMPLE ",
                          desc:
                              "If friend A uses your referral code on their Ist order of ₹600, you get *300 Credits. On A's 2nd order of *200, you get ₹100 Credits. On A's 3rd order of ₹400, you get ₹100 Credits to complete ₹500.",
                          step: " ",
                          imgpath: "assets/images/s4.png"),
                    ],
                  ),
                ),
              ),

              //order button -> navigates to homescreen
              //  Ordernow(),
              ElevatedButton(
                onPressed: () {},
                style: CustomButtonStyles.orangeButton.copyWith(
                  minimumSize: WidgetStatePropertyAll(
                    Size(
                      screenWidth * 0.9,
                      50,
                    ),
                  ),
                ),
                child: const Text("ORDER NOW"),
              ),

              SizedBox(
                height: screenHeight * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
