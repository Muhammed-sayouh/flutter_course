import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool valueOfSwitchTile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is the Categories Screen"),
            SwitchListTile(
              title: Text("Switch Button"),
              subtitle: Text("This is a switch button"),
                value: valueOfSwitchTile,
                onChanged: (value) {
                  setState(() {
                    valueOfSwitchTile = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
