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
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(DecreaseQuantity(pizzaId));
                },
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),

              // Item Count
              Text(
                "$quantity", // Default count
                style: TextStyle(fontSize: 14.0), // Smaller text
              ),

              // Increment Button
              IconButton(
                icon: Icon(Icons.add, size: 14.0), // Smaller icon
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
