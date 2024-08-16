import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/account/views/widgets/bullet_point.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "TERMS & CONDITIONS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Size of the bottom section
          child: Divider(),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              BulletPoint(
                  data:
                      "The customer's delivery location falls within the permitted delivery zone of the designated Mojo Pizza outlet."),
              BulletPoint(
                  data:
                      "The delivery address being mapped to the nearest outlet that delivers in the customer's delivery location."),
              BulletPoint(
                  data:
                      "Online availability of the outlet to accept and process the order."),
              BulletPoint(
                  data:
                      "In the event, the customer's delivery location is not listed within the permitted delivery zone of the outlet, the order cannot be placed. However, you may choose to pick up your order from the nearest Mojo Pizza outlet."),
              BulletPoint(
                  data:
                      "The menu is displayed as per the availability of the menu items in the selected outlet."),
              BulletPoint(
                  data:
                      "In case certain items from the menu are not listed, the particular outlet does not carry those items on their menu."),
              BulletPoint(
                  data:
                      "In case of non-availability of ordered menu items at the selected outlet, the order will not be executed and will be duly informed to the customer."),
              BulletPoint(
                  data:
                      "The complete and accurate coupon code must be entered in the coupon section on the payment page before completing the transaction, in order to avail the discount."),
              BulletPoint(data: "The coupon code is not case sensitive."),
              BulletPoint(
                  data:
                      "The coupon code may not work if the conditions defined in the coupon T&C are not met in the order."),
              BulletPoint(
                  data:
                      "Mojo Pizza holds the right to accept or reject any coupon without giving any reason whatsoever."),
              BulletPoint(
                  data:
                      "All coupons carry a validity period, mentioned in the coupon T&C and will not be accepted after the expiry of the validity period."),
              BulletPoint(
                  data:
                      "The customer must handover the coupon which is entered in the coupon section while placing the order to the delivery person, failing which the order may be cancelled."),
              BulletPoint(
                  data:
                      "A coupon/promotion cannot be clubbed with any other offer or scheme."),
              BulletPoint(data: "Only one coupon is valid per order."),
              BulletPoint(
                  data:
                      "Coupons are not applicable on Legend, appetizers and on Drinks & Desserts."),
              BulletPoint(
                  data:
                      "Coupons are only valid on the Mojo Pizza mobile app & website."),
              BulletPoint(
                  data:
                      "The customer must announce the coupon and coupon code while placing the order."),
              BulletPoint(
                  data:
                      "The customer must cut and hand over the coupon to the delivery person when they receive the order."),
              BulletPoint(data: "All prices are exclusive of taxes."),
              BulletPoint(data: "Offer valid only in participating outlets."),
              BulletPoint(
                  data:
                      "Orders once placed cannot be modified or cancelled either online or by the call centre."),
              BulletPoint(
                  data:
                      "If the customer wishes to check on the progress of the order, they may do so by calling the outlet directly."),
              BulletPoint(
                  data:
                      "In the event an order which is paid via credit card is cancelled due to non-availability of the ordered product, the amount will be reversed back to the customer. The transaction will reflect in the next month statement."),
              BulletPoint(
                  data:
                      "Mojo Pizza terms an order with 6 or more items as a bulk order."),
              BulletPoint(
                  data:
                      "The customer must cut and hand over the coupon to the delivery person when they receive the order."),
              BulletPoint(
                  data:
                      "Food from Mojo Pizza is for immediate consumption only (within 30 minutes from time of delivery)."),
            ],
          ),
        ),
      ),
    ));
  }
}
