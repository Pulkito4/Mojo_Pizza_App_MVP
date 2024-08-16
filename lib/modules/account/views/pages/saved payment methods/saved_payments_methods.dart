import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/saved%20payment%20methods/linked_wallets.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/saved%20payment%20methods/saved_cards.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/saved%20payment%20methods/saved_upi_ids.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/saved_payments_card.dart';

class SavedPaymentsMethods extends StatelessWidget {
  const SavedPaymentsMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            "SAVED PAYMENT METHODS",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SavedPaymentsCard(
                  iconData: Icons.keyboard_double_arrow_right_sharp,
                  title: "Saved UPI IDs",
                  description: "Manage your saved UPI IDs",
                  navigateTo: SavedUpiIds()),
              SavedPaymentsCard(
                  iconData: Icons.wallet,
                  title: "Linked Wallets",
                  description:
                      "Keep your wallets linked for hassle free payments",
                  navigateTo: LinkedWallets()),
              SavedPaymentsCard(
                  iconData: Icons.calendar_view_day_sharp,
                  title: "Saved Cards",
                  description: "Easy access to Credit/Debit Card details",
                  navigateTo: SavedCards()),
              Row(
                children: [
                  Icon(
                    Icons.shield_rounded,
                    color: Colors.grey,
                  ),
                  Text(
                    "Don't worry, your information is safe.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
