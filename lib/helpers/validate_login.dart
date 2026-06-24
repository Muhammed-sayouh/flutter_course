import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isAuth() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("token") != null) {
    return true;
  } else {
    return false;
  }
}
