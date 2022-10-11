import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:vege_food/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> list = [
    HomePage(),
    Center(child: Text('cart page')),
    Center(child: Text('notification page')),
    Center(child: Text('profile page')),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: list[_selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(
            () {
              _selectedIndex = index;
            },
          ),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text('Home'),
              activeColor: _selectedIndex == 0 ? Colors.orange : Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              title: Text('Cart'),
              activeColor: _selectedIndex == 1 ? Colors.orange : Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
              activeColor: _selectedIndex == 2 ? Colors.orange : Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person_outline_outlined),
              title: Text('Profile'),
              activeColor: _selectedIndex == 3 ? Colors.orange : Colors.grey,
            ),
          ],
        ));
  }
}
