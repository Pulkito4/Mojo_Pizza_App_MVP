import 'package:flutter/material.dart';

class Flatoff extends StatelessWidget {
  const Flatoff({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Row(
              children: [
                Text("Flat OFF", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: screenSize.width*0.05,
              runSpacing: screenSize.height*0.02,
              children: [
                // Image.asset('assets/images/off(1).jpg')
                GestureDetector(
                  onTap: (){ ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(child: Text('Code Copied!')),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Color.fromARGB(255, 142, 142, 142),
                            ),
                          );},
                  child: Image.asset('assets/images/off (1).jpg',
                  height: screenSize.height*0.25,),
                ),
                GestureDetector(
                  onTap: (){ ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(child: Text('Code Copied!')),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Color.fromARGB(255, 142, 142, 142),
                            ),
                          );},
                  child: Image.asset('assets/images/delivery(2).jpg',
                  height: screenSize.height*0.25,),
                ),
                GestureDetector(
                  onTap: (){ ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(child: Text('Code Copied!')),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Color.fromARGB(255, 142, 142, 142),
                            ),
                          );},
                  child: Image.asset('assets/images/chocolava(3).jpg',
                  height: screenSize.height*0.25,),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}