// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "CHANGE PASSWORD",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Divider(
              height: 5,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(customHintText: "Current Password"),
            CustomTextField(customHintText: "New Password"),
            CustomTextField(customHintText: "Confirm New Password"),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(16),
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
