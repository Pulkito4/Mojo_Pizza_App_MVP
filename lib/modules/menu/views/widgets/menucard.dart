import 'package:flutter/material.dart';

class Menucard extends StatefulWidget {
final String imgpath;
final String title;
final String description;
final String price;
final bool isVeg;



  const Menucard({super.key, 
  required this.imgpath,
  required this.title,
  required this.description,
  required this.price,
  required this.isVeg});

  @override
  State<Menucard> createState() => _MenucardState();
}

class _MenucardState extends State<Menucard> {

  bool isVeg=true;
  void veg(){
    setState(() {
      isVeg=!isVeg;
    });
  }


  @override
  Widget build(BuildContext context) {
  double screenWidth=MediaQuery.of(context).size.width;
  double screenHeight=MediaQuery.of(context).size.height;
  double textSize=screenWidth*0.05;

    return Card(
      margin: EdgeInsets.all(15),
      color: Color.fromARGB(255, 255, 255, 255),
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight*0.55,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(widget.imgpath,
                width: screenWidth,
                height: screenHeight*0.24,
                //fit: BoxFit.cover,
                ),
              ),
              Padding(padding: EdgeInsets.only(top:189, bottom: 15),
              //text container
              child: Container(
                height: screenHeight*0.45,
                width: screenWidth,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      
                      Row(
                        children: [
                          Icon(Icons.square_rounded, color: Colors.green,),   //*********isVeg
                          SizedBox(width: 10,),
                           Expanded(
                             child: Text(widget.title,           //********* title
                             maxLines: 3,
                             style: TextStyle(fontSize:textSize ,fontWeight:FontWeight.bold),),
                           )
                        ],
                      ),
                     SizedBox(height: 10,),
                     Expanded(
                       child: Text(widget.description, 
                       maxLines:4,  //********** description
                       style: TextStyle(
                        fontSize:textSize*0.8,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic
                       ),),
                     ),
                     SizedBox(height: 15,),
                     Row(
                      children: [
                        Text("₹ ${widget.price}", 
                        style: TextStyle(
                          color: const Color.fromARGB(255, 62, 62, 62),
                          fontWeight: FontWeight.w700,
                          fontSize:textSize,)),
                          SizedBox(width: screenWidth*0.52,),
                          OutlinedButton(
                            onPressed: (){}, 
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: const Color.fromARGB(255, 99, 98, 98))
                              )
                            ),
                          child: Text("ADD", style: TextStyle(
                            color: Colors.orange,
                            fontSize:textSize*0.8,
                          ),))
                      ]
                     ),
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      )
      
    );
  }
}

