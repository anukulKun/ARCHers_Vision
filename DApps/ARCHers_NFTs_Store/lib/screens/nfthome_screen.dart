import 'package:flutter/material.dart';

import '../ecomm/main.dart';
import '../nftt/main.dart';
import '../wallet/main.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MyAppnft(),
    Store(),
    MyAppp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'NFT Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'E-commerce Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'wallet',
          ),
        ],
      ),
    );
  }
  
}

