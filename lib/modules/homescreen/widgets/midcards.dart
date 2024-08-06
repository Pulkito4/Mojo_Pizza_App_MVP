
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Midcards extends StatefulWidget {
  final String imgpath;
  //final String menu;
  const Midcards({super.key, required this.imgpath});

  @override
  State<Midcards> createState() => _MidcardsState();
}

class _MidcardsState extends State<Midcards> {
  
  @override
  Widget build(BuildContext context) {

    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.transparent,
        child: SizedBox(
          height: screenHeight*0.2,
          width: screenWidth*0.43,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.imgpath,
            fit: BoxFit.cover,
            ),
          ),
          
        ),
      ),
    );
  }
}