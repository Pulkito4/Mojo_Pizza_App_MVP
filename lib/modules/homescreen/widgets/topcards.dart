import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Topcards extends StatelessWidget {
  const Topcards({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      items: [
        "assets/topcard/p1.png",
        "assets/topcard/p2.png",
        "assets/topcard/p3.png",
        "assets/topcard/p4.png",
        "assets/topcard/p5.png",
        "assets/topcard/p6.png",
        "assets/topcard/p7.png",
      ].map(
        (imgurl) {
          return Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.9,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imgurl,
                  height: screenHeight * 0.22,
                  width: screenWidth * 0.9,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 220,
        viewportFraction: 0.90,
      ),
    );
  }
}
