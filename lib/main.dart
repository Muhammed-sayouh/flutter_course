import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/translations/ar.dart';
import 'package:flutter_course/helpers/translations/en.dart';
import 'package:flutter_course/helpers/translations/get_my_trans.dart';
import 'package:flutter_course/helpers/validate_login.dart';
import 'package:flutter_course/ui/bottom_navigator_bar.dart';
import 'package:flutter_course/ui/categories_screen.dart';
import 'package:flutter_course/ui/login/controller/login_controller.dart';
import 'package:flutter_course/ui/profile_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
      child: GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
        translations: Translation(getArLaunguage(), getEnLaunguage()),
        locale: const Locale("ar"),
        fallbackLocale: const Locale("ar"),
        title: 'My App',
        theme: ThemeData(
          fontFamily: 'AfcoFontAr',
        ),
        home:BottomNavBar() ,
        // isLogin ? BottomNavBar() : LoginScreen(),
        routes: {
          "/profile": (context) => const ProfileScreen(),
          "/categories": (context) => const CategoriesScreen(),
        },
      ),
    );
  }
}
 // Get.updateLocale(Locale("ar"));