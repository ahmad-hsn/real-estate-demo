import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent, // Allow transparency for the scaffold background
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const MapPage(),
    const Center(child: Text('Messages Page')),
    const HomePage(),
    const Center(child: Text('Favorites Page')),
    const Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _pages[_selectedIndex],
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(90),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(icon: Icons.search, index: 0, isCenter: true),
              _buildNavItem(icon: Icons.message, index: 1, isCenter: true),
              _buildNavItem(icon: Icons.home, index: 2, isCenter: true),
              _buildNavItem(icon: Icons.favorite, index: 3, isCenter: true),
              _buildNavItem(icon: Icons.person, index: 4, isCenter: true),
            ],
          ),
        )
      ],
    ));
  }

  Widget _buildNavItem({required IconData icon, required int index, bool isCenter = false}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        decoration: isCenter && _selectedIndex == index
            ? const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              )
            : null,
        padding: isCenter ? const EdgeInsets.all(8) : null,
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}


