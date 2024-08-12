import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/help%20&%20support/help_support_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/refer_and_earn.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/saved%20payment%20methods/saved_payments_methods.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/views/settings_personalisation.dart';
import 'package:mojo_pizza_app_mvp/modules/eatClubScreen/views/pages/eatClub.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/sign_up_screen.dart';

import '../widgets/account_page_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Account Info Section  // Login section with Login Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Account',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "Login to manage your account",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    style: CustomButtonStyles.orangeButton.copyWith(
                      fixedSize: WidgetStateProperty.all<Size>(
                        const Size(100, 30),
                      ),
                    ),
                    child: const Text("LOGIN"),
                  )
                ],
              ),
              const SizedBox(height: 50),

              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Eatclub()));
                  },
                  child: Image.asset('assets/logos/eatclub_card.jpg')),

              const SizedBox(height: 50),

              // Account Page Cards Section
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPersonalisation()));
                },
                child: const AccountPageCard(
                  icon: Icons.settings_outlined,
                  title: "Settings & Personalization",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReferAndEarn()));
                },
                child: const AccountPageCard(
                  icon: Icons.people_outline_outlined,
                  title: "Refer & Earn",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {},
                child: const AccountPageCard(
                  icon: Icons.monetization_on,
                  title: "Credits",
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
                          builder: (context) => SavedPaymentsMethods()));
                },
                child: const AccountPageCard(
                  icon: Icons.payments_outlined,
                  title: "Saved Payment Methods",
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HelpSupportScreen(),
                    ),
                  );
                },
                child: const AccountPageCard(
                  icon: Icons.call_outlined,
                  title: "Help & Support",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
