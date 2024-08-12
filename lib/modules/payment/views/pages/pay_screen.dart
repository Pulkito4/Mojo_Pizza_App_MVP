import 'package:flutter/material.dart';
import '../pages/razorpay.dart';
import '../pages/upi.dart';
import '../widgets/paybtn.dart';

class PayScreen extends StatefulWidget {
  final String totalpay;
  const PayScreen({super.key,
  required this.totalpay
  });

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  late PaymentSc _paymentSc;

  @override
  void initState() {
    super.initState();
    _paymentSc = PaymentSc(widget.totalpay); // Initialize the payment class
  }

  @override
  void dispose() {
    _paymentSc.dispose(); // Dispose of the payment class
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenText = screenWidth * 0.5;
    const Color tealcol = Color.fromARGB(255, 77, 185, 173);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title:  Padding(
            padding: EdgeInsets.only(left: 35.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.totalpay,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "(6 items)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text("You've saved ₹400 on this order",
                    style: TextStyle(
                        color: tealcol,
                        fontSize: 17,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: screenHeight * 0.15,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 10, right: 10, bottom: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: screenHeight * 0.035,
                                  width: screenWidth * 0.25,
                                  color: Color.fromARGB(255, 211, 233, 249),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.shopping_bag_sharp),
                                      Text("Delivery At",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.22,
                              ),
                              const Text("Delivery in 20-25 mins",
                                  style: TextStyle(
                                      color: tealcol,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic)),
                            ],
                          ),
                          const Divider(
                            thickness: 0.5,
                            color: Color.fromARGB(255, 86, 86, 86),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Vivekananda Institute of Professional Studies, Delhi-110034",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[850],
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenText * 0.08),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Paybtn(
                  method: "Pay with UPI",
                  onPressed: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context) => Upipay(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Paybtn(
                  method: "Pay with RazorPay",
                  onPressed: () {
                    _paymentSc.openCheckout(widget.totalpay); 
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
