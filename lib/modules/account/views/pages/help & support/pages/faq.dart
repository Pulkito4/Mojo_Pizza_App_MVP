import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/expansion_card.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

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
          ExpansionCard(heading: "I am not able to login to my account.", details: "Open the app and tap on Account. Tap on the top right LOGIN button and sign in using your phone number or other login options. Please note if you are a new user, you need to sign up first"),
          ExpansionCard(heading: "I did not receive OTP.", details: "If you did not receive the OTP, please check your cellular network to see if you are receiving SMSes. If you do not have a network issue, please try the Resend OTP option."),
          ExpansionCard(heading: "I forgot my password.", details: "If you forget your password, you can use your mobile number to login via OTP. You can change your password by following these steps: 1. Tap on Forgot Password button on your log-in screen 2. Enter your registered Email ID or Phone Number 3. You will receive an email/SMS with a unique verification code 4. Use the verification code to create a new password Keep your password confidential. Our Support Team will never ask you for your password."),
          ExpansionCard(heading: "How do I unsubscribe from Notifications?", details: "To unsubscribe, go to Account > Settings & Personalization > Manage Notifications"),
          ExpansionCard(heading: "Do you take bulk order requests?", details: "Yes, we do accept bulk orders. To place a bulk order, go to our website's Home page > Deals > Bulk Orders and fill up the form. Alternatively, you can call us on (022 - 33493949) to place a Bulk Order.")
          
        ],
      ),
      ));
  }
}