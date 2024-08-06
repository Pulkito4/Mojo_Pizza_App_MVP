
import 'package:flutter/material.dart';
import '../../homescreen/widgets/bigcards.dart';
import '../../homescreen/widgets/midcards.dart';
import '../../homescreen/widgets/topcards.dart';

//import 'package:google_fonts/google_fonts.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  //late final String address;
  

  @override
  Widget build(BuildContext context) {

    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    double textSize=screenWidth*0.05;
    //dynamic sb=SizedBox(height: 15,);
  
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Padding(
            padding:  EdgeInsets.only(top:10.0, bottom: 4),
            child:  Row(
                    children: [
                      Icon(Icons.location_on_sharp, size: 35, color: Colors.red,),
                      SizedBox(width:5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        children: [
                          Text("DELIVER AT",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                           Icon(Icons.arrow_drop_down, size: 35,)
                        ],
                      ),
                      //link location address here
                      Text("some address",style: TextStyle(fontSize: 18,)),
                        ],
                      )
                      
                    ],
                  ),
          ), 
        ),
        
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.all(20),
          child:  Column(
            children: [
      
              const Topcards(),
         
              const SizedBox(height: 20,),
         
              //mid card-> offer / referral
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  
                  children: [
                    Card(
                      color:  const Color.fromARGB(255, 239, 217, 202),
                      child:SizedBox(
                        height: screenHeight*0.12,
                        width: screenWidth*0.76,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/topcard/c1.png")),
                
                        )
                    ),
                    Card(
                      color: Color.fromARGB(255, 239, 217, 202),
                      child:SizedBox(
                        height: screenHeight*0.12,
                        width: screenWidth*0.76,
                         child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                           child: Image.asset("assets/topcard/c2.png",
                           fit : BoxFit.contain),
                         ),
                
                        )
                    )
                  ],
                ),
              ),
         
              const SizedBox(height: 30,),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Shop by Category", 
                style:TextStyle(fontSize: textSize*1.2, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20,),

              const Column(
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Midcards(imgpath: 'assets/menu/tenveg.png',),
              Midcards(imgpath: 'assets/menu/tennv.png',),
                ],
              ),
              
              SizedBox(height: 10,),
              Bigcards(imgpath: 'assets/menu/funvalue.png',),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Midcards(imgpath: 'assets/menu/sevnv.png',),
              Midcards(imgpath: 'assets/menu/sevveg.png',),
                ],
              ),
              SizedBox(height: 10,),
              Bigcards(imgpath: 'assets/menu/brands.png',),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Midcards(imgpath: 'assets/menu/dandd.png',),
             
              Midcards(imgpath: 'assets/menu/gb.png',),
                ],
              ),
              SizedBox(height: 10,),
                ],

              ),
              
              
         
         
            ],
          ),),
       ),
      )
    );
  }
}