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
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

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
          style:
              TextStyle(fontSize: 12, color: Colors.grey), // Small title text
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: controller,
                enabled: isEnabled,
                decoration: InputDecoration(
                  hintText: 'Enter your ${title.toLowerCase()}',
                  hintStyle: TextStyle(color: Colors.grey),
                  // border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                onToggle(!isEnabled);
              },
            ),
          ],
        ),
        SizedBox(height: 16), // Space between text boxes
      ],
    );
  }

  Future<void> _handleSubmit() async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );

    // Simulate a delay (e.g., network request)
    await Future.delayed(Duration(seconds: 2));

    // Close loading dialog
    Navigator.of(context).pop();

    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
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
          title: Text('PERSONAL INFORMATION'),
          actions: [
            if (isAnyTextBoxEnabled())
              GestureDetector(
                  onTap: () {
                    _handleSubmit;
                  },
                  child: Text(
                    "UPDATE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            // IconButton(
            //   icon: Icon(Icons.check),
            //   onPressed: () {
            //     // Action when the AppBar button is pressed
            //     // print('AppBar button pressed');
            //   },
            // ),
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
        //   appBar: AppBar(
        //       leading: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon: Icon(Icons.arrow_back)),
        //       title: Text(
        //         "PERSONAL INFORMATION",
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //       ),
        //        actions: isEnabled
        //       ? [
        //           IconButton(
        //             icon: Icon(Icons.check),
        //             onPressed: () {
        //               // Action when the AppBar button is pressed
        //               // print('AppBar button pressed');
        //             },
        //           ),
        //         ]
        //       : [],
        //       bottom:
        //       PreferredSize(
        //         preferredSize: Size.fromHeight(4),
        //         child: Divider(height: 5,)),
        //     ),
        //     body: Column(
        //       children: [
        //         ProfileDetailsTextbox(title: "Name",),
        //         SizedBox(height: screenSize.height*0.02,),
        //         ProfileDetailsTextbox(title: "Mobile",),
        //         SizedBox(height: screenSize.height*0.02,),
        //         ProfileDetailsTextbox(title: "Email", ),
        //         SizedBox(height: screenSize.height*0.02,),
        //         ProfileDetailsTextbox(title: "My Birthday",)
        //       ],
        //     ),
        //    floatingActionButton: SizedBox(
        //     width: screenSize.width*0.5,
        //     child: FloatingActionButton(
        //     onPressed: () {
        //       // Add your onPressed code here!
        //     },
        //     child: Row(
        //       children: [

        //         Icon(Icons.delete, color: const Color.fromARGB(255, 93, 93, 93)),
        //         Text("DELETE ACCOUNT"),
        //       ],
        //     ), // Adjust icon color for visibility
        //     backgroundColor: Colors.white, // Make FAB background white
        //     elevation: 0, // Remove shadow
        //           ),
        //   ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
