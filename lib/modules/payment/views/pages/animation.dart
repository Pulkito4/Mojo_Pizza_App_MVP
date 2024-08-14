import 'package:flutter/material.dart';
import 'orderhome.dart';
import 'orderpgenteranimation.dart';

class PaymentConfirmed extends StatefulWidget {
  const PaymentConfirmed({super.key});

  @override
  State<PaymentConfirmed> createState() => _PaymentConfirmedState();
}

class _PaymentConfirmedState extends State<PaymentConfirmed>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Orderpgenteranimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Orderpgenteranimation(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Orderhome(
      controller: _controller,
      animation: _animation,
    );
  }
}
