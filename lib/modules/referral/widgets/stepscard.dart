


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Stepscard extends StatelessWidget {
  final String stepnum;
  final String step;
  final String desc;
  final String imgpath;

  const Stepscard({
    super.key,
    required this.stepnum,
    required this.step,
    required this.desc,
    required this.imgpath,
    
    });

  @override
  Widget build(BuildContext context) {


  double screenWidth=MediaQuery.of(context).size.width;
  double screenHeight=MediaQuery.of(context).size.height;
  double textSize=screenWidth*0.045;
    return Card(
      //shadowColor: const Color.fromARGB(0, 84, 18, 18),
      //bg color white
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
           width: screenWidth*0.97, 
           height: screenHeight*0.19, 
          child: Row(
            children: [
              Image.asset(imgpath, 
              height: screenHeight*0.3,
              width: screenWidth*0.3,
              ),
              SizedBox(width: screenWidth*0.03,),
              Flexible(
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stepnum, 
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.teal[400], 
                      fontSize: textSize, 
                      fontWeight: FontWeight.bold),),
                
                    Text(step,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: textSize*0.8, 
                      fontWeight: FontWeight.bold),),

                    Expanded(
                      child: Text(desc,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      maxLines: 8,
                      style: TextStyle(color: Colors.black, fontSize: textSize*0.73, fontWeight: FontWeight.normal),),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),


    );
  }
}