import 'package:flutter/material.dart';

class Ordernow extends StatefulWidget {
  const Ordernow({super.key});

  @override
  State<Ordernow> createState() => _OrdernowState();
}

class _OrdernowState extends State<Ordernow> {
  @override
  Widget build(BuildContext context) {


  double screenWidth=MediaQuery.of(context).size.width;
  //double screenHeight=MediaQuery.of(context).size.height;
  double textSize=screenWidth*0.05;
    return SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
             child: TextButton(
                    style: ButtonStyle(
                      
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 145, 1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),),
                    onPressed: (){}, 
                    child: Text("ORDER NOW",
                    style: TextStyle(
                      fontSize: textSize, 
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),),
           )
;
  }
}