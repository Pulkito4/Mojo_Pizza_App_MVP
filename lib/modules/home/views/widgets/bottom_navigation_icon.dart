import 'package:flutter/material.dart';

class BottomNavigationIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData selectedIcon;
  const BottomNavigationIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(icon, color: Colors.black),
      selectedIcon: Icon(selectedIcon ,color: Colors.black),
      label: label,
    );
  }
}
