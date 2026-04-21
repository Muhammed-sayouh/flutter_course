import 'package:flutter/material.dart';
import 'package:flutter_course/categories_screen.dart';
import 'package:flutter_course/home_screen.dart';
import 'package:flutter_course/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomeScreen(),
      routes: {
        "/profile": (context) => ProfileScreen(),
        "/categories": (context) => CategoriesScreen(),
      },
    );
  }
}
