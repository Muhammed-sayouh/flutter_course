import 'package:flutter/material.dart';
import 'package:flutter_course/ui/categories_screen.dart';
import 'package:flutter_course/ui/home_screen.dart';
import 'package:flutter_course/ui/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
const  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<BottomNavigationBarItem> myItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  List<Widget> myScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: selectedIndex,
        items: myItems,
        onTap: (value) {
          setState(() {
             selectedIndex = value;
          });
        },
      ),
    );
  }
}
