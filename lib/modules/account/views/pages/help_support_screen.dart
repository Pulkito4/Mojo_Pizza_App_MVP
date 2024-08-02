import 'package:flutter/material.dart';

import '../widgets/help_support_card.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              color: Colors.grey,
              height: 1.0,
              thickness: 1.2,
              indent: 16.0,
              endIndent: 16.0,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("ASSISTANCE WITH OTHER ISSUES",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
              SizedBox(height: 10),

              // Help & Support Cards
              HelpSupportCard(title: "FAQs",),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              HelpSupportCard(title: "Referrals & Coupons",),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              HelpSupportCard(title: "Payment",),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              HelpSupportCard(title: "EatClub Membership",),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              HelpSupportCard(title: "Terms and conditions",),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

