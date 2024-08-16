import 'package:flutter/material.dart';

import '../../../../../shared/services/google_oauth.dart';
import '../../../../sign_up/views/pages/sign_up_screen.dart';
import '../../widgets/personalisation_card.dart';
import 'change_password.dart';
import 'manage_notification.dart';
import 'profile_details.dart';
import 'saved_addresses.dart';

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
