import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/all%20offers/FlatOff/flatOff.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/freebies.dart';

class AlloffersScreen extends StatelessWidget {
  // const AlloffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Freebies(), Flatoff()],
      ),
    );
  }
}
