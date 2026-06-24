import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/dio_package.dart';
import 'package:flutter_course/ui/bottom_navigator_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loader = false;

  bool hasError = false;

  TextEditingController loginController = TextEditingController();

  Future<void> login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setState(() {
        loader = true;
      });
      Response myResponse = await dio().post('auth/login', data: {
        "phone": loginController.text,
        "device_type": "android",
        "device_token": "cascnasjcnksancxnacj knfcrwhjfcrhfw"
      },
     
      );

      if (myResponse.statusCode == 200) {
        prefs.setString("token", myResponse.data["data"]['api_token']);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const BottomNavBar(),
          ),
        );
      } else if (myResponse.statusCode == 422) {
        print("phone not correct");
      } else {
        print("Error From else");
      }
    } catch (e) {
      print("Error From catch");
      setState(() {
        hasError = true;
      });

      print("Error $e");
    } finally {
      setState(() {
        loader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: loginController,
          ),
          loader
              ? Text("Login ... ")
              : TextButton(onPressed: () => login(), child: Text("Login"))
        ],
      ),
    );
  }
}
