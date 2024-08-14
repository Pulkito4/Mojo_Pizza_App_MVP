import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/expansion_card.dart';

class ReferralAndCoupons extends StatelessWidget {
  const ReferralAndCoupons({super.key});

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
        children: [
          ExpansionCard(
              heading: "How do I use a referral code?",
              details:
                  "You can use referral codes in the following ways: 1. Apply your friend's referral code as a coupon on the Cart page to avail the referral discount 2. Share your own referral code with unlimited friends and earn credits everytime they order from MOJO Pizza"),
          ExpansionCard(heading: "Where can I find my referral code?", details: "To get your referral code, open the app and go to Account > Refer & Earn or Tap on the Free Pizza icon at the bottom of the Home page. Please note: Your referral code is generated after your first order is delivered."),
          ExpansionCard(heading: "I have referred a friend but did not receive any credits.", details: "To receive credits through referral, your friend needs to use your referral code in the Apply Promo Code section at checkout while placing their FIRST order on our platform. It takes 30 mins for credits to reflect in your account post your friend's order delivery."),
          ExpansionCard(heading: "How do I earn using the referral program?", details: "Go to Account > Refer & Earn. Share your referral code with as many friends as you wish. You can share it on your instagram story, whatsapp groups/status or send it to them personally. Every time a friend orders using your code (at checkout), you get credits worth 50% of your friend's order value, until you earn 500 credits per friend."),
          ExpansionCard(heading: "How do coupon codes work?", details: "Add food items to your cart and proceed to checkout. Before making payment, tap on Apply Promo Code and select a code from the list or you can enter your coupon code, and click on apply.")
        ],
      ),
    ));
  }
}
