import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/custom_button_styles.dart';
// import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/profile_details_textbox.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  // bool isEnabled = false;
  // bool showIcon = true;
  // State variables to track the enabled state of each text box
  bool isEnabled1 = false;
  bool isEnabled2 = false;
  bool isEnabled3 = false;
  bool isEnabled4 = false;

  // Controllers for each text box
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  // Check if any text box is enabled
  bool isAnyTextBoxEnabled() {
    return isEnabled1 || isEnabled2 || isEnabled3 || isEnabled4;
  }

  // Function to build each custom text box
  Widget buildCustomTextBox(String title, TextEditingController controller,
      bool isEnabled, Function(bool) onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
              fontSize: 12, color: Colors.grey), // Small title text
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: controller,
                enabled: isEnabled,
                decoration: InputDecoration(
                  hintText: 'Enter your ${title.toLowerCase()}',
                  hintStyle: const TextStyle(color: Colors.grey),
                  // border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                onToggle(!isEnabled);
              },
            ),
          ],
        ),
        const SizedBox(height: 16), // Space between text boxes
      ],
    );
  }

  Future<void> _handleSubmit() async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );

    // Simulate a delay (e.g., network request)
    await Future.delayed(const Duration(seconds: 2));

    // Close loading dialog
    Navigator.of(context).pop();

    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your details have been saved successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PERSONAL INFORMATION'),
          actions: [
            if (isAnyTextBoxEnabled())
              GestureDetector(
                  onTap: () {
                    _handleSubmit;
                  },
                  child: const Text(
                    "UPDATE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              buildCustomTextBox('Name', _controller1, isEnabled1, (value) {
                setState(() {
                  isEnabled1 = value;
                });
              }),
              buildCustomTextBox('Mobile', _controller2, isEnabled2, (value) {
                setState(() {
                  isEnabled2 = value;
                });
              }),
              buildCustomTextBox('Email', _controller3, isEnabled3, (value) {
                setState(() {
                  isEnabled3 = value;
                });
              }),
              buildCustomTextBox('My Birthday', _controller4, isEnabled4,
                  (value) {
                setState(() {
                  isEnabled4 = value;
                });
              }),
            ],
          ),
        ),
        bottomNavigationBar: isAnyTextBoxEnabled()
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  style: CustomButtonStyles.orangeButton.copyWith(
                    minimumSize: WidgetStatePropertyAll(
                      Size(
                        screenSize.width * 0.9,
                        50,
                      ),
                    ),
                  ),
                  child: const Text("SUBMIT"),
                ),
              )
            : null,
      ),
    );
  }
}
