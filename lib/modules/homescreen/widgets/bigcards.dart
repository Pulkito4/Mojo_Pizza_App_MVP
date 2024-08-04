import 'package:flutter/material.dart';

class Bigcards extends StatefulWidget {
    final String imgpath;
  const Bigcards({super.key, required this.imgpath});


  @override
  State<Bigcards> createState() => _BigcardsState();
}

class _BigcardsState extends State<Bigcards> {
  @override
  Widget build(BuildContext context) {


    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;

    return Card(
      color: Colors.black,
      child: SizedBox(
        height: screenHeight*0.2,
        width: screenWidth*0.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(widget.imgpath,
            fit: BoxFit.cover,
            ),
        ),
        
      ),
    );
  }
}