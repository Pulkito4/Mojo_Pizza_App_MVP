import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/menu/views/widgets/menucard.dart';

class MenuItems extends StatelessWidget {
  final String category;

  const MenuItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('menu')
            .doc("Category")
            .collection(category)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map(
              (doc) {
                String imageUrl =
                    doc['image']; // Fetch the pizza image URL from Firestore
                String title =
                    doc['title']; // Fetch the pizza title from Firestore
                String description = doc[
                    'description']; // Fetch the pizza description from Firestore
                int price =
                    doc['price']; // Fetch the pizza price from Firestore
                bool isVeg =
                    doc['isVeg']; // Fetch the pizza type from Firestore

                return Menucard(
                    imgpath: imageUrl,
                    title: title,
                    description: description,
                    price: price.toString(),
                    isVeg: isVeg);
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
