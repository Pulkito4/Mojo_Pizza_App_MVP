import 'package:flutter/material.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/views/widgets/flatOff.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/views/widgets/freebies.dart';

class AlloffersScreen extends StatelessWidget {
  const AlloffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [ Freebies(), Flatoff()],
      ),
    );
  }
}
