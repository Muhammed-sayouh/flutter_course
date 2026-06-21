import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/dio_package.dart';

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
    try {
      setState(() {
        loader = true;
      });
      Response myResponse = await dio().post('auth/login', data: {
        "phone": loginController.text,
        "device_type": "android",
        "device_token": "cascnasjcnksancxnacj knfcrwhjfcrhfw"
      });

      if (myResponse.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('you are authinticated'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Handle error case
      }
    } catch (e) {
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
