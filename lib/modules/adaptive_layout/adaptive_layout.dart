import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget desktopLayout;
  final Widget mobileLayout;
  final Widget tabLayout;
  const AdaptiveLayout({super.key, required this.desktopLayout, required this.mobileLayout, required this.tabLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return desktopLayout;
        } else if (constraints.maxWidth > 800) {
          return tabLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}