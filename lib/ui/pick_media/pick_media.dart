import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickMediaScreen extends StatefulWidget {
  const PickMediaScreen({super.key});

  @override
  State<PickMediaScreen> createState() => _PickMediaScreenState();
}

class _PickMediaScreenState extends State<PickMediaScreen> {
  XFile? image;
  Future<void> getLostData(int type) async {
    final picker = ImagePicker();
    image = await picker.pickImage(source:type == 0 ? ImageSource.camera : ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Media Screen"),
      ),
      body: Center(
        child: Column(
          children: [

            Image.file(File(image!.path)),
             
            TextButton(
              onPressed:()=>getLostData(0) ,
              child: Text("Pick from camera"),
            ),
              TextButton(
              onPressed:()=>getLostData(1) ,
              child: Text("Pick from gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
