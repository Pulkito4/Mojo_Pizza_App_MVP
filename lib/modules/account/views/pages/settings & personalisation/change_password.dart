// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/custom_text_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
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
          "CHANGE PASSWORD",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Divider(
              height: 5,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CustomTextField(customHintText: "Current Password"),
            const CustomTextField(customHintText: "New Password"),
            const CustomTextField(customHintText: "Confirm New Password"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                style: CustomButtonStyles.orangeButton.copyWith(
                  minimumSize: WidgetStatePropertyAll(
                    Size(
                      screenWidth * 0.9,
                      50,
                    ),
                  ),
                ),
                child: const Text("ORDER NOW"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
