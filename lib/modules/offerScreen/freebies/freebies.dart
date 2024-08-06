import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/umbrella.dart';

class Freebies extends StatelessWidget {
  // const Freebies({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Row(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Umbrella()));
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Free Umbrella worth ₹300",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Valid once/user",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(child: Text('Code Copied!')),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                backgroundColor:
                                    Color.fromARGB(255, 142, 142, 142),
                              ),
                            );
                          },
                          child: Container(
                            width: screenSize.width * 0.5,
                            height: screenSize.height * 0.025,
                            color: Colors.grey[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "COPY CODE : UMBRELLA",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.copy,
                                  color: Colors.green,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.15,
                    ),
                    Container(
                      // color: Colors.black,
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 10,
              color: const Color.fromARGB(255, 209, 208, 208),
            )
          ],
        ),
      ),
    );
  }
}
