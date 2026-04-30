import 'package:flutter/material.dart';
import 'package:flutter_course/ui/categories_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("This is the Profile Screen"),
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
              child: const Text("Go Back"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: MediaQuery.of(context).size.width *0.2,
                    child: const Text(""),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: const Text(""),
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
