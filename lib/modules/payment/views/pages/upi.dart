import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class Upipay extends StatefulWidget {
  final String totalpay;
  const Upipay({super.key, required this.totalpay});

  @override
  State<Upipay> createState() => _UpipayState();
}

class _UpipayState extends State<Upipay> {
  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  void initState() {
    super.initState();
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      print(e);
      setState(() {
        apps = [];
      });
    });
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "8851119444@paytm",
      receiverName: 'Tanishka',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: double.parse(widget.totalpay.replaceAll(RegExp(r'[^\d.]'), '').trim()),
    );
  }

  Widget? displayUPIapps() {
    if (apps == null) {
      return Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty) {
      return Center(child: Text('No UPI Apps found'));
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(height: 10),
                      Text(app.name, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  Widget displayTransactionStatus() {
    if (_transaction == null) {
      return Text("Select a UPI app to initiate the transaction");
    } else {
      return FutureBuilder<UpiResponse>(
        future: _transaction,
        builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            UpiResponse response = snapshot.data!;
            switch (response.status) {
              case UpiPaymentStatus.SUCCESS:
                return Text("Transaction Successful!");
              case UpiPaymentStatus.FAILURE:
                return Text("Transaction Failed!");
              case UpiPaymentStatus.SUBMITTED:
                return Text("Transaction Submitted!");
              default:
                return Text("Unknown response status");
            }
          } else {
            return Text("No data");
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Integrate UPI"),
      ),
      body: Column(
        children: [
          Expanded(child: displayUPIapps()!),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: displayTransactionStatus(),
          ),
        ],
      ),
    );
  }
}
