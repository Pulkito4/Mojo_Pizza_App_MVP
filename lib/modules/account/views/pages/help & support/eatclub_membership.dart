import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/expansion_card.dart';

class EatclubMembership extends StatelessWidget {
  const EatclubMembership({super.key});

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
          ExpansionCard(heading: "What is EatClub?", details: "EatClub membership offers Flat 30% OFF on every order and ZERO Delivery/Packaging Fees on all brands available on the EatClub platform."),
          ExpansionCard(heading: "If I buy my EatClub membership along with an order, will the benefits apply on that order?", details: "Yes, definitely! If you add a membership plan to your cart with your order, Flat 30% OFF and FREE Delivery will be applied to all the food items in your cart."),
          ExpansionCard(heading: "How do I become an EatClub member?", details: "Log-in with your registered email or phone no. on the app. Go to the EatClub section and choose your membership plan. Make payment and your EatClub membership is activated. The benefits will be applied to every order you make including the one you make with the purchase of membership."),
          ExpansionCard(heading: "Where can I find the details about my purchased EatClub membership?", details: "Head to EatClub section on the bottom of the home page to see all the details of your EatClub membership."),
          ExpansionCard(heading: "What is the minimum and maximum discount limit that I can avail through EatClub?", details: "The minimum order value for ordering with EatClub is ₹100. The maximum discount you can get on each order is ₹2000."),
          ExpansionCard(heading: "Can other discounts be combined with EatClub discount?", details: "FREE Delivery & Packaging benefit can be combined with 'Buy 1 Get 1 Free' & 'Happy Hours', 'Daily Value @99' but 30% off is not applicable on top of these discounts. Cashback/rewards by payment partners can also be combined with EatClub discount."),
          ExpansionCard(heading: "How do I cancel my EatClub membership?", details: "You cannot cancel your EatClub membership."),
          ExpansionCard(heading: "What are the products on which EatClub discount is applicable?", details: "You can order any item on our menu with EatClub, regardless of the amount. 30% Off discount is not applicable on Add-ons, MRP products like Pepsi, Water and special category items like Happy Hours, Buy 1 Get 1 Free etc but, FREE Delivery & Packaging is applicable."),
          ExpansionCard(heading: "Are EatClub benefits applicable to unlimited orders?", details: "Yes, EatClub benefits apply to all orders during the duration of the membership. There is no limit on the number of orders."),
          ExpansionCard(heading: "On which platforms can I use EatClub membership?", details: "EatClub membership can be used on EatClub, MOJO Pizza and BOX8 app/website."),
          ExpansionCard(heading: "Is EatClub membership applicable at all locations?", details: "Yes, EatClub membership is valid at all stores across all our operational cities."),
          ExpansionCard(heading: "Can I transfer my EatClub membership to another mobile number?", details: "Sorry, your membership can be linked to only one phone number and is not tranfserrable."),
        ]
      ),
    ));
  }
}