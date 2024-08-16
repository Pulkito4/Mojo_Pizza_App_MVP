import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/help%20&%20support/eatclub_membership.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/help%20&%20support/faq.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/help%20&%20support/payments.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/help%20&%20support/referral_and_coupons.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/help%20&%20support/terms_and_conditions.dart';

import '../../widgets/help_support_card.dart';

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
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text("ASSISTANCE WITH OTHER ISSUES",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
              const SizedBox(height: 10),

              // Help & Support Cards
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Faq(),
                    ),
                  );
                },
                child: const HelpSupportCard(
                  title: "FAQs",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReferralAndCoupons(),
                    ),
                  );
                },
                child: const HelpSupportCard(
                  title: "Referrals & Coupons",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Payments(),
                    ),
                  );
                },
                child: const HelpSupportCard(
                  title: "Payment",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EatclubMembership(),
                    ),
                  );
                },
                child: const HelpSupportCard(
                  title: "EatClub Membership",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsAndConditions(),
                      ),
                    );
                  },
                  child: const HelpSupportCard(
                    title: "Terms and conditions",
                  )),
              const Divider(
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
