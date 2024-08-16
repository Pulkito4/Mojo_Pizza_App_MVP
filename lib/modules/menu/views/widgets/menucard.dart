import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_pizza_app_mvp/modules/cart/bloc/cart_bloc.dart';
import 'package:mojo_pizza_app_mvp/modules/cart/bloc/cart_event.dart';
import 'package:mojo_pizza_app_mvp/modules/cart/views/widgets/add_item_button.dart';

import '../../../cart/bloc/cart_state.dart';

class Menucard extends StatelessWidget {
  final String imgpath;
  final String title;
  final String description;
  final String price;
  final bool isVeg;
  final String pizzaId;
  final String category;

  const Menucard(
      {super.key,
      required this.imgpath,
      required this.title,
      required this.description,
      required this.price,
      required this.isVeg,
      required this.pizzaId,
      required this.category});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textSize = screenWidth * 0.05;

    return Card(
        margin: const EdgeInsets.all(15),
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.49,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    imgpath,
                    width: screenWidth,
                    height: screenHeight * 0.24,
                    //fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 189, bottom: 15),
                  //text container
                  child: Container(
                    height: screenHeight * 0.47,
                    width: screenWidth,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              (isVeg)
                                  ? const Icon(
                                      Icons.square_rounded,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.square_rounded,
                                      color: Colors.red,
                                    ), //*********isVeg
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  title, //********* title
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: textSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Text(
                              description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3, //********** description
                              style: TextStyle(
                                  fontSize: textSize * 0.85,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₹ $price",
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 62, 62, 62),
                                      fontWeight: FontWeight.w700,
                                      fontSize: textSize,
                                    )),
                                BlocBuilder<CartBloc, CartState>(
                                  builder: (context, state) {
                                    final cartItem = state.items.firstWhere(
                                      (item) => item.pizzaId == pizzaId,
                                      orElse: () => CartItem(
                                          pizzaId: pizzaId, quantity: 0),
                                    );
                                    bool isInCart = state.items
                                        .any((item) => item.pizzaId == pizzaId);
                                    int quantity =
                                        isInCart ? cartItem.quantity : 0;

                                    return (isInCart)
                                        ? AddItemButton(
                                            quantity: quantity,
                                            pizzaId: pizzaId)
                                        : OutlinedButton(
                                            onPressed: () {
                                              BlocProvider.of<CartBloc>(context)
                                                  .add(AddToCart(
                                                      pizzaId,
                                                      category,
                                                      title,
                                                      int.parse(price),
                                                      isVeg));
                                            },
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 99, 98, 98),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "ADD",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: textSize * 0.8,
                                              ),
                                            ),
                                          );
                                  },
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
