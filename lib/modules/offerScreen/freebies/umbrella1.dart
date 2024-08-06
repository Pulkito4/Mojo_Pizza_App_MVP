import 'package:flutter/material.dart';

class Umbrella1 extends StatelessWidget {
  const Umbrella1({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
          'assets/images/umbrella_bg.jpg',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
          top: screenSize.height*0.18,
          child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: 
               SingleChildScrollView(
                child: 
                Padding(padding: const EdgeInsets.all(16),
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
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Free Umbrella worth ₹300",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                        softWrap: true,),
                                  
                                ],
                              )
                          ],
                        ),
                      )
                    ],

                  ),)
                  ,
              ),


        ))
        ],
      ),
    );
  }
}