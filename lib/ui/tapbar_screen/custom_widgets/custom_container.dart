import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final Color containerColor;
  const CustomContainer(
      {super.key, required this.title, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor,
          border: Border.all(color: Colors.teal)),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
