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

  void openCheckout(String totalpayment) async {
    int amountInPaise = (double.parse(totalpayment) * 100).toInt();
    print(totalpayment);
    var options = {
      'key': 'rzp_test_QuCbsq1kJTOrdW',
      'amount': amountInPaise, // in paise
      'currency': 'INR',
      'name': 'MOJO PIZZA',
      'description': 'Flutter Pay',
      'timeout': 60, // in seconds
      'prefill': {
        'contact': '9000090000',
        'email': 'gaurav.kumar@example.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Successful : ${response.paymentId}", toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed : ${response.message}", toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet : ${response.walletName}", toastLength: Toast.LENGTH_SHORT);
  }
}
