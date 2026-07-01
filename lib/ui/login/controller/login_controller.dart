import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/dio_package.dart';
import 'package:flutter_course/ui/bottom_navigator_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController with ChangeNotifier {
  bool loader = false;

  bool hasError = false;

  TextEditingController loginController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      loader = true;
      notifyListeners();
      Response myResponse = await dio().post(
        'auth/login',
        data: {
          "phone": loginController.text,
          "device_type": "android",
          "device_token": "cascnasjcnksancxnacj knfcrwhjfcrhfw"
        },
        // options: Options(headers: {
        //   "Accept": "application/json",
        //   "authorization": "Bearer "
        // })
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

      hasError = true;
      notifyListeners();

      print("Error $e");
    } finally {
      loader = false;
      notifyListeners();
    }
  }

  void changeUi() {
    print("");
    notifyListeners();
  }
}
