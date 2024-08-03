import 'package:flutter/material.dart';

class ReferWidgets extends StatelessWidget {
  final String description;
  final String imgpath;
  
  
  const ReferWidgets({super.key, required this.description, required this.imgpath});

  

  @override
  Widget build(BuildContext context) {


  double screenWidth=MediaQuery.of(context).size.width;
  double screenHeight=MediaQuery.of(context).size.height;
  double textSize=screenWidth*0.05;
    return Card(
                      color: Colors.black,
                      child: SizedBox(
                       
                      width: screenWidth*0.85, 
                      height: screenHeight*0.55, 
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 8, top: 8, bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(description, style: TextStyle(color: Colors.white, fontSize: textSize*0.7),
                              maxLines: 4,),
                            ),
                            SizedBox(width: 10,),
                            Image.asset(imgpath,
                            fit: BoxFit.cover,)
                            //Text(description, style: TextStyle(color: Colors.white)),
                          ]
                        ),
                      ),
                    ),
                    );
  }
}