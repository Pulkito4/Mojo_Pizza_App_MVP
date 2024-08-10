import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("\$100",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        Container(
          width: MediaQuery.of(context).size.width * 0.30, // Small width
          height: 30.0, // Small height
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4.0), // Smaller border radius
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Decrement Button
              IconButton(
                icon: Icon(Icons.remove, size: 14.0), // Smaller icon
                onPressed: () {},
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),

              // Item Count
              Text(
                "1", // Default count
                style: TextStyle(fontSize: 14.0), // Smaller text
              ),

              // Increment Button
              IconButton(
                icon: Icon(Icons.add, size: 14.0), // Smaller icon
                onPressed: () {},
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),
            ],
          ),
        )
      ],
    );
  }
}
