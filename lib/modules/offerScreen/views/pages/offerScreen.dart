import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/views/widgets/flatOff.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/views/widgets/allOffers_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/views/widgets/freebies.dart';

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
        title: const Text('DEALS'),
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
                const SizedBox(width: 20,),
                _buildSectionButton('AllOffers', 'All Offers'),
                const SizedBox(width: 20,),
        
                _buildSectionButton('Freebies', 'Freebies'),
                const SizedBox(width: 20,),
                _buildSectionButton('FlatOff', 'Flat Off'),
              ],
            ),
            const SizedBox(height: 25,),
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
            isSelected ? const Color.fromARGB(255, 255, 123, 0) : Colors.grey.shade300),
        foregroundColor: WidgetStateProperty.all(
            isSelected ? Colors.white : const Color.fromARGB(115, 0, 0, 0),),
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
        return const Freebies();
      case 'FlatOff':
        return Flatoff();
      case 'AllOffers':
      default:
        return const AlloffersScreen();
    }
  }
}