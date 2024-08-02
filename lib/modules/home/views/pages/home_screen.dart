import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const IconData gift = IconData(0xf689,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

  final ValueNotifier<int> _currentPageIndex = ValueNotifier<int>(0);

  final _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined, color: Colors.black),
      selectedIcon: Icon(Icons.home, color: Colors.black),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.percent_outlined, color: Colors.black),
      selectedIcon: Icon(Icons.percent, color: Colors.black),
      label: 'Offers',
    ),
    NavigationDestination(
      icon: Icon(Icons.fastfood_outlined, color: Colors.black),
      selectedIcon: Icon(Icons.fastfood, color: Colors.black),
      label: 'EatClub',
    ),
    NavigationDestination(
      icon: Icon(CupertinoIcons.gift, color: Colors.black),
      selectedIcon: Icon(CupertinoIcons.gift_fill, color: Colors.black),
      label: 'Free Pizza',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline, color: Colors.black),
      selectedIcon: Icon(Icons.person, color: Colors.black),
      label: 'Account',
    ),
  ];

  final screens = const [
    'HomeScreen',
    'Offer Screen',
    'EatClub Screen',
    'Free Pizza Screen',
    'Acount Screen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentPageIndex,
        builder: (context, index, _) {
          return Center(child: Text(screens[index]));
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        child: ValueListenableBuilder<int>(
          valueListenable: _currentPageIndex,
          builder: (context, index, _) {
            return NavigationBar(
              destinations: _destinations,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              selectedIndex: index,
              indicatorColor: Colors.transparent,
              onDestinationSelected: (index) {
                _currentPageIndex.value = index;
              },
            );
          },
        ),
      ),
    );
  }
}
