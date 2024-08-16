import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentSc {
  final String totalpayment;
  late Razorpay _razorpay;

  PaymentSc(this.totalpayment) {
    print(totalpayment);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear(); // Removes all listeners
  }

  String sanitizeTotalPay(String totalPay) {
    // Remove any non-digit characters and trim
    return totalPay.replaceAll(RegExp(r'[^\d.]'), '').trim();
  }

  void openCheckout(String totalpayment) async {
    String cleanTotalPayment = sanitizeTotalPay(totalpayment);

    try {
      double paymentAmount = double.parse(cleanTotalPayment);
      int amountInPaise = (paymentAmount * 100).toInt();

      var options = {
        'key': 'rzp_test_QuCbsq1kJTOrdW',
        'amount': amountInPaise, // in paise
        'currency': 'INR',
        'name': 'MOJO PIZZA',
        'description': 'Flutter Pay',
        'timeout': 60, // in seconds
        'prefill': {
          'contact': '8851119444',
          'email': 'tgoel029@gmail.com'
        }
      };

      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error parsing total payment: $e");
    }
  }

  // void openCheckout(String totalpayment) async {
  //   String totalpay = totalpayment.toString();
  //   double paymentAmount = double.tryParse(totalpay) ?? 0.0;
  //   int amountInPaise = (paymentAmount * 100).toInt();
  //   print("at checkout function :$amountInPaise");
  //   var options = {
  //     'key': 'rzp_test_QuCbsq1kJTOrdW',
  //     'amount': amountInPaise, // in paise
  //     'currency': 'INR',
  //     'name': 'MOJO PIZZA',
  //     'description': 'Flutter Pay',
  //     'timeout': 60, // in seconds
  //     'prefill': {'contact': '9000090000', 'email': 'gaurav.kumar@example.com'}
  //   };

  //   try {
  //     _razorpay.open(options);
  //   } catch (e) {
  //     debugPrint("Error: $e");
  //   }
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful : ${response.paymentId}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed : ${response.message}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet : ${response.walletName}",
        toastLength: Toast.LENGTH_SHORT);
  }
}
