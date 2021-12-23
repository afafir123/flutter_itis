import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image.dart';

class Homework3 extends StatefulWidget {
  const Homework3({Key? key}) : super(key: key);
  
  final String title = "homework 3";
  
  @override
  _Homework3State createState() => _Homework3State();
}

class _Homework3State extends State<Homework3> {
  List<String> images = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        _showImage(index);
                      },
                      child: Image.file(File(images[index]),
                          width: 200.0, height: 200.0, fit: BoxFit.fitHeight),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.camera_enhance_outlined),
                    iconSize: 70,
                    onPressed: () {
                      _addImageFromCamera();
                    },
                  ),
                  // Text('Camera');
                  IconButton(
                    icon: const Icon(Icons.image_outlined),
                    iconSize: 70,
                    onPressed: () {
                      _addImageFromGallery();
                    },
                  ),
                  // Text('Camera');
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addImageFromGallery() async {
    XFile? image = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50));
    setState(() {
      images.add(image!.path);
    });
  }

  void _addImageFromCamera() async {
    XFile? image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50));
    setState(() {
      images.add(image!.path);
    });
  }

  void _showImage(int index) {
    Navigator.of(context).push(
        MaterialPageRoute(
        builder: (context) => ImageScreen(imagePath: images[index])));
  }
}
