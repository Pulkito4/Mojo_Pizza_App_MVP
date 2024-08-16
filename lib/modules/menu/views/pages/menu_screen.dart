import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/cart/views/pages/cart_screen.dart';

import '../widgets/menu_items.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Menu"),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(),
                onPressed: () {},
                child: const Text(
                  "Veg",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
          bottom: const TabBar(
            isScrollable: true, // Make the TabBar scrollable
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: "Value Fun Pizza"),
              Tab(text: "Regular 7\" | Veg Pizza"),
              Tab(text: "Regular 7\" | Non-Veg Pizza"),
              Tab(text: "Regular 10\" |Veg Pizza"),
              Tab(text: "Regular 10\" |Non-Veg Pizza"),
              Tab(text: "Garlic Breads"),
              Tab(text: "Desserts & Drinks"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MenuItems(category: "value fun pizza"),
            MenuItems(category: "regular 7 pizza veg"),
            MenuItems(category: "regular 7 pizza non veg"),
            MenuItems(category: "big 10 pizza veg"),
            MenuItems(category: "big 10 pizza non veg"),
            MenuItems(category: "garlic breads"),
            MenuItems(category: "deserts and drinks"),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 255, 123, 0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
