import 'package:flutter/material.dart';
import 'orderpgenteranimation.dart';

class Orderhome extends StatelessWidget {
  const Orderhome({super.key, required this.controller, required this.animation});

  final AnimationController controller;
  final Orderpgenteranimation animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => _buildAnimation(context, child, size),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child, Size size) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 250,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              topbar(animation.barheight.value),
              circle(size, animation.avatarSize.value),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              Opacity(
                opacity: animation.titleopacity.value,
                child: Text(
                  "Woohoo!!!!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 123, 0),
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Opacity(
                opacity: animation.textopacity.value,
                child: Text(
                  "Your order has been placed successfully and will be delivered soon.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:const Color.fromARGB(255, 255, 123, 0),
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Opacity(
                opacity: animation.textopacity.value,
                child: Text(
                  "Happy Eating :)",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container topbar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: const Color.fromARGB(255, 255, 123, 0),
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 200,
      left: size.width / 2 - 50,
      child: Transform(
        transform: Matrix4.diagonal3Values(animationValue, animationValue, 1.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 202, 99, 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.check_circle_outline_sharp,
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
    );
  }
}
