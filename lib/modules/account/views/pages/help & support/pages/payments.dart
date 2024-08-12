import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/expansion_card.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        title: const Text(
          'Help & Support',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: const [
          ExpansionCard(heading: "My money got debited but the order is not placed.", details: "Please be assured that your total amount will be refunded back to the source within 24-48 hours. You can place a new order again."),
          ExpansionCard(heading: "Can I pay online when my order is delivered to me?", details: "You can select Pay Online on Delivery option while placing your order."),
          ExpansionCard(heading: "I have queries about refund", details: "Go to Account > Manage Orders and find the order for which you have a query. Tap on View Details and then tap on HELP on top right corner."),
        ],
      ),
    ));
  }
}