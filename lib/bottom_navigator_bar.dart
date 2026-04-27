import 'package:flutter/material.dart';
import 'package:flutter_course/categories_screen.dart';
import 'package:flutter_course/home_screen.dart';
import 'package:flutter_course/profile_screen.dart';

class MottomNavBar extends StatefulWidget {
const  MottomNavBar({super.key});

  @override
  State<MottomNavBar> createState() => _MottomNavBarState();
}

class _MottomNavBarState extends State<MottomNavBar> {
  List<BottomNavigationBarItem> myItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  List<Widget> myScreens = [
    HomeScreen(),
    CategoriesScreen(),
    ProfileScreen(),
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
        unselectedLabelStyle: TextStyle(color: Colors.black),
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
