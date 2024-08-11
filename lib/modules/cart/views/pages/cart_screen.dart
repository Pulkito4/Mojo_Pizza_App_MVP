import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../custom_button_styles.dart';
import '../../bloc/cart_bloc.dart';
import '../../bloc/cart_event.dart';
import '../../bloc/cart_state.dart';
import '../widgets/add_item_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final double packingCost = 25.0;
  final double deliveryCost = 50.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Cart"),
        ),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }

          final updatedState = state.copyWith(
            packingCost: packingCost,
            deliveryCost: deliveryCost,
          );

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mojo pizza",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: state.items.map((item) {
                            return ListTile(
                              leading: Icon(
                                Icons.local_pizza,
                                color: (item.isVeg) ? Colors.green : Colors.red,
                              ),
                              title: Text(item.pizzaName),
                              subtitle:
                                  Text('Price: ₹${item.price * item.quantity}'),
                              trailing: AddItemButton(
                                  quantity: item.quantity,
                                  pizzaId: item.pizzaId),
                            );
                          }).toList(),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "ADD TIP FOR RIDER",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "The entire amount transferred to the rider",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [0, 10, 20, 30, 50].map((tip) {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddTipEvent(tip.toDouble()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                              child: Text(
                                "₹$tip",
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Bill Details",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Subtotal"),
                                Text("₹${updatedState.subTotal}"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Packaging Charges"),
                                Text("₹${packingCost.toString()}"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Delivery Fee"),
                                Text("₹${deliveryCost.toString()}"),
                              ],
                            ),
                            /* const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Discount"),
                                  Text("₹50"),
                                ],
                              ), */

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total payable",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹${updatedState.total}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen[100],
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Text(
                                "Congratulations! You have saved ₹50 on this order",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: BottomAppBar(
          height: MediaQuery.of(context).size.height * 0.18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Delivery in 26-36 min',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: CustomButtonStyles.orangeButton,
                  child: const Text("Place Order"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
