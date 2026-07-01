import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/validate_login.dart';
import 'package:flutter_course/ui/bottom_navigator_bar.dart';
import 'package:flutter_course/ui/categories_screen.dart';
import 'package:flutter_course/ui/login/controller/login_controller.dart';
import 'package:flutter_course/ui/login/login_screen.dart';
import 'package:flutter_course/ui/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  Future<void> getIsAuth() async {
    final result = await isAuth();

    setState(() {
      isLogin = result;
    });

    print(isLogin);
  }

  @override
  void initState() {
    getIsAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          fontFamily: 'AfcoFontAr',
        ),
        home: isLogin ? BottomNavBar() : LoginScreen(),
        routes: {
          "/profile": (context) => const ProfileScreen(),
          "/categories": (context) => const CategoriesScreen(),
        },
      ),
    );
  }
}
