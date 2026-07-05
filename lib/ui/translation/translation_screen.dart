import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TanslationScreen extends StatefulWidget {
  const TanslationScreen({super.key});

  @override
  State<TanslationScreen> createState() => _TanslationScreenState();
}

class _TanslationScreenState extends State<TanslationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translation Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("hello".tr),
            Text("login".tr),
            Text("email".tr),
            Text("password".tr),
            Text("login_success".tr),
            Text("login_failed".tr),
            Text("home_screen".tr),
            TextButton(onPressed: (){
              setState(() {
                 Get.updateLocale(const Locale("en"));
              });
            }, child: Text("english")),
            TextButton(onPressed: (){

                 setState(() {
                 Get.updateLocale(const Locale("ar"));
              });
            }, child: Text("arabic")),
          ],
        ),
      ),
    );
  }
}