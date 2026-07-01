import 'package:flutter/material.dart';
import 'package:flutter_course/ui/login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // bool loader = false;
  @override
  Widget build(BuildContext context) {
    // final myLoginProvider = Provider.of<LoginController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            // controller: myLoginProvider.loginController,
          ),
          Consumer<LoginController>(
            builder: (context, value, _) => value.loader
                ? Text("Login ... ")
                : TextButton(
                    onPressed: () => value.login(context),
                    child: Text("Login")),
          ),
        ],
      ),
    );
  }
}
