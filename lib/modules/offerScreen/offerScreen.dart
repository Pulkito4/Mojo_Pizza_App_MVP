import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/all%20offers/FlatOff/flatOff.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/all%20offers/allOffers_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/freebies.dart';

class Offerscreen extends StatefulWidget {
  const Offerscreen({super.key});

  @override
  State<Offerscreen> createState() => _OfferscreenState();
}

class _OfferscreenState extends State<Offerscreen> {
  // Track which section is currently selected
  String selectedSection = 'AllOffers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEALS'),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Button row to switch between sections
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                _buildSectionButton('AllOffers', 'All Offers'),
                SizedBox(width: 20,),
        
                _buildSectionButton('Freebies', 'Freebies'),
                SizedBox(width: 20,),
                _buildSectionButton('FlatOff', 'Flat Off'),
              ],
            ),
            SizedBox(height: 25,),
            Expanded(
              child: _buildSelectedSection(),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a section button with dynamic styling
  Widget _buildSectionButton(String section, String text) {
    bool isSelected = selectedSection == section;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            isSelected ? Color.fromARGB(255, 255, 123, 0) : Colors.grey.shade300),
        foregroundColor: WidgetStateProperty.all(
            isSelected ? Colors.white : Color.fromARGB(115, 0, 0, 0),),
      ),
      onPressed: () {
        setState(() {
          selectedSection = section;
        });
      },
      child: Text(text),
    );
  }

  // Method to return the widget corresponding to the selected section
  Widget _buildSelectedSection() {
    switch (selectedSection) {
      case 'Freebies':
        return Freebies();
      case 'FlatOff':
        return Flatoff();
      case 'AllOffers':
      default:
        return AlloffersScreen();
    }
  }
}

//   String selectedSection = 'allOffers';

//   // bool isTapped = false;

//   // void onTap() {
//   //   setState(() {
//   //     isTapped = !isTapped;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "DEALS",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Column(
//         children: [
//           Divider(
//             height: 5,
//             color: Colors.grey[400],
//           ),
//           SizedBox(
//             height: screenSize.height * 0.01,
//           ),
//           Row(
//             children: [
//               // ElevatedButton(
//               //     onPressed: () {
//               //       // Freebies();
//               //       // onTap();
//               //     },
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: isTapped
//               //           ? Color.fromARGB(255, 255, 123, 0)
//               //           : Color.fromARGB(
//               //               255, 223, 227, 230), // Background color
//               //       foregroundColor: isTapped
//               //           ? Colors.white
//               //           : Color.fromARGB(115, 0, 0, 0), // Foreground color
//               //     ),
//               //     child: Text("All Offers")),
//               // ElevatedButton(
//               //     onPressed: onTap,
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: isTapped
//               //           ? Color.fromARGB(255, 255, 123, 0)
//               //           : Color.fromARGB(
//               //               255, 223, 227, 230), // Background color
//               //       foregroundColor: isTapped
//               //           ? Colors.white
//               //           : Color.fromARGB(115, 0, 0, 0), // Foreground color
//               //     ),
//               //     child: Text("Freebies")),
//               // ElevatedButton(
//               //     onPressed: onTap,
//               //     style: ElevatedButton.styleFrom(
//               //       backgroundColor: isTapped
//               //           ? Color.fromARGB(255, 255, 123, 0)
//               //           : Color.fromARGB(
//               //               255, 223, 227, 230), // Background color
//               //       foregroundColor: isTapped
//               //           ? Colors.white
//               //           : Color.fromARGB(115, 0, 0, 0), // Foreground color
//               //     ),
//               //     child: Text("Flat OFF")),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
