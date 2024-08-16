import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/bloc/user_bloc.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/bloc/user_state.dart';
import '../../cart/views/pages/cart_screen.dart';
import '../../homescreen/widgets/bigcards.dart';
import '../../homescreen/widgets/midcards.dart';
import '../../homescreen/widgets/topcards.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth * 0.05;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 4),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_sharp,
                size: 35,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "DELIVER AT",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 35,
                      )
                    ],
                  ),
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                    return Text(
                      state.address,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    );
                  }),
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
          child: Column(
            children: [
              const Topcards(),

              const SizedBox(
                height: 20,
              ),

              //mid card-> offer / referral
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                        color: const Color.fromARGB(255, 239, 217, 202),
                        child: SizedBox(
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.76,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/topcard/c1.png")),
                        )),
                    Card(
                        color: const Color.fromARGB(255, 239, 217, 202),
                        child: SizedBox(
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.76,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/topcard/c2.png",
                                fit: BoxFit.contain),
                          ),
                        ))
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Shop by Category",
                    style: TextStyle(
                        fontSize: textSize * 1.2, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),

              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Midcards(
                        imgpath: 'assets/menu/tenveg.png',
                      ),
                      Midcards(
                        imgpath: 'assets/menu/tennv.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Bigcards(
                    imgpath: 'assets/menu/funvalue.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Midcards(
                        imgpath: 'assets/menu/sevnv.png',
                      ),
                      Midcards(
                        imgpath: 'assets/menu/sevveg.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Bigcards(
                    imgpath: 'assets/menu/brands.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Midcards(
                        imgpath: 'assets/menu/dandd.png',
                      ),
                      Midcards(
                        imgpath: 'assets/menu/gb.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 123, 0),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    ));
  }
}
