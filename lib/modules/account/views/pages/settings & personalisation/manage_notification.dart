import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/toggle_switch.dart';

class ManageNotification extends StatelessWidget {
  const ManageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            "MANAGE NOTIFICATIONS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(4),
              child: Divider(
                height: 5,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email Notification",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ToggleSwitch()
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SMS Notification",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ToggleSwitch()
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Push Notification",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ToggleSwitch()
                ],
              ),
              const Spacer(),
              const Text(
                  "By opting out of promotional subscription, you will stop receiving notifications on new PRODUCTS and attractive OFFERS that we run from time to time"),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {},
                style: CustomButtonStyles.orangeButton.copyWith(
                  minimumSize: WidgetStatePropertyAll(
                    Size(
                      screenWidth * 0.9,
                      50,
                    ),
                  ),
                ),
                child: const Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
