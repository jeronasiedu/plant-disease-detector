import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/instructions.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  Future<void> takePicture() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Disease Detector'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takePicture,
        child: const Icon(Icons.camera_alt_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 30, 12, 5),
          children: [
            const InstructionsCard(),
            const SizedBox(
              height: 15,
            ),
            imageFile != null
                ? Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(imageFile!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    // width: double.maxFinite,
                    // height: 300,
                    // decoration: const BoxDecoration(
                    //   color: Colors.blue,
                    // ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({Key? key, required this.imageFile}) : super(key: key);
  final imageFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.file(imageFile),
      ),
    );
  }
}
