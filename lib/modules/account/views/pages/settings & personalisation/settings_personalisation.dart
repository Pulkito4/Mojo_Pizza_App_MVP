import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/change_password.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/manage_notification.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/profile_details.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/saved_addresses.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/personalisation_card.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/sign_up_screen.dart';
import 'package:mojo_pizza_app_mvp/shared/services/google_oauth.dart';

class SettingsPersonalisation extends StatelessWidget {
  SettingsPersonalisation({super.key});

  final GoogleOauth googleOauth = GoogleOauth();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            "SETTINGS & PERSONALISATION",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              PersonalisationCard(
                title: "Profile Details",
                description: "Change your display name, contact details etc.",
                navigateTo: ProfileDetails(),
              ),
              PersonalisationCard(
                title: "Saved Addresses",
                description:
                    "Save all your addresses and never have to worry about typing them in.",
                navigateTo: SavedAddresses(),
              ),
              PersonalisationCard(
                title: "Manage Notification",
                description: "Customize how you receive communication from us.",
                navigateTo: ManageNotification(),
              ),
              PersonalisationCard(
                title: "Change Password",
                description: "Set a new password or change an existing one.",
                navigateTo: ChangePassword(),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: screenSize.width * 0.3,
          child: FloatingActionButton(
            onPressed: () {
              googleOauth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            backgroundColor: Colors.white, // Make FAB background white
            elevation: 0, // Remove shadow

            child: const Row(
              children: [
                Text("LOG OUT"),
                Icon(Icons.exit_to_app, color: Colors.grey),
              ],
            ), // Adjust icon color for visibility
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
