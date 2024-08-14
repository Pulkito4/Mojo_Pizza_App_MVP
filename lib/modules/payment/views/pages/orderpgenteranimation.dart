import 'package:flutter/animation.dart';

class Orderpgenteranimation {
  Orderpgenteranimation(this.controller)
      : barheight = Tween<double>(begin: 0, end: 250).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.3, curve: Curves.easeIn),
          ),
        ),
        avatarSize = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.6, curve: Curves.elasticOut),
          ),
        ),
        titleopacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.65, curve: Curves.easeIn),
          ),
        ),
        textopacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.65, 0.8),
          ),
        );

  final AnimationController controller;
  final Animation<double> barheight;
  final Animation<double> avatarSize;
  final Animation<double> titleopacity;
  final Animation<double> textopacity;
}
