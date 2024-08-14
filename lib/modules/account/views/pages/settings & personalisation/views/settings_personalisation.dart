import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/views/pages/change_password.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/views/pages/manage_notification.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/views/pages/profile_details.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/pages/settings%20&%20personalisation/views/pages/saved_addresses.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/personalisation_card.dart';

class SettingsPersonalisation extends StatelessWidget {
  const SettingsPersonalisation({super.key});

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
            icon: Icon(Icons.arrow_back)),
          title: Text(
            "SETTINGS & PERSONALISATION",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Padding(
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
          width: screenSize.width*0.3,
          child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Row(
            children: [
              Text("LOG OUT"),
              Icon(Icons.exit_to_app, color: Colors.grey),
            ],
          ), // Adjust icon color for visibility
          backgroundColor: Colors.white, // Make FAB background white
          elevation: 0, // Remove shadow
                ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        
      ),
    );
  }
}
