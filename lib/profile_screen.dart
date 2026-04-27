import 'package:flutter/material.dart';
import 'package:flutter_course/categories_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is the Profile Screen"),
            ElevatedButton(
              onPressed: () {
                // عشان نروح لصفحة الكاتيجوريز ونمسح كل الصفحات اللي قبلها
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CategoriesScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );

                // عشان نرجع من اي سكرين
                // Navigator.of(context).pop();
              },
              child: Text("Go Back"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: MediaQuery.of(context).size.width *0.2,
                    child: Text(""),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Text(""),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
