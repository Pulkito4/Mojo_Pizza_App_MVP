import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/menutester.dart';

import '../widgets/menu_items.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
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
                style: OutlinedButton.styleFrom(
                 // add ui feature : when button is selected green bg and white text
                ),
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
        body: const  TabBarView(
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
      ),
    );
  }
}
