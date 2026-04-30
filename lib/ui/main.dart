import 'package:flutter/material.dart';
import 'package:flutter_course/ui/bottom_navigator_bar.dart';
import 'package:flutter_course/ui/categories_screen.dart';
import 'package:flutter_course/ui/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: const BottomNavBar(),
      routes: {
        "/profile": (context) => const ProfileScreen(),
        "/categories": (context) => const CategoriesScreen(),
      },
    );
  }
}
