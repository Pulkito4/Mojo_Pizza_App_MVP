import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_pizza_app_mvp/modules/cart/bloc/cart_event.dart';

import '../../bloc/cart_bloc.dart';

class AddItemButton extends StatelessWidget {
  final int quantity;
  final String pizzaId;
  const AddItemButton({super.key, required this.quantity, required this.pizzaId});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
     
        Container(
          width: 110.0, // Small width
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
                icon:const Icon(Icons.remove, size: 14.0), // Smaller icon
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(DecreaseQuantity(pizzaId));
                },
                padding: const EdgeInsets.all(0), // Remove default padding
                constraints:const BoxConstraints(), // Remove default constraints
              ),

              // Item Count
              Text(
                "$quantity", // Default count
                style: const TextStyle(fontSize: 14.0), // Smaller text
              ),

              // Increment Button
              IconButton(
                icon: const Icon(Icons.add, size: 14.0, color:  Color.fromARGB(255, 255, 123, 0),), // Smaller icon
                onPressed: () {
 BlocProvider.of<CartBloc>(context).add(IncreaseQuantity(pizzaId));
                },
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
