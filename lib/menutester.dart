import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Menutester extends StatelessWidget {
  const Menutester({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('menu').doc("Category").collection("value fun pizza").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          }

 // Print the type and value of the image URL for debugging
        print('Image URL Type: ${snapshot.data!.docs[0]['image'].runtimeType}');
        print('Image URL: ${snapshot.data!.docs[0]['image']}');

            return ListView(
            children: snapshot.data!.docs.map((doc) {
              String imageUrl = doc['image']; // Fetch the image URL from Firestore


              // Check if the URL is a valid string
            if (imageUrl is! String || imageUrl.isEmpty) {
              return ListTile(
                title: Text(doc['title']), // Replace 'title' with the actual field name
                subtitle: Text('Invalid image URL'),
              );
            }
              return ListTile(
                title: Text(doc['title']), // Replace 'field_name' with the actual field name
                subtitle: imageUrl.isNotEmpty
                    ? Image.network(imageUrl) // Display the image from the URL
                    : Text('No image available'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}