import 'dart:io';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  final String imagePath;

  ImageScreen({Key? key, required this.imagePath}) : super(key: key);
  final String title = "Image";

  @override
  _ImageScreenState createState() => _ImageScreenState();

}

class _ImageScreenState extends State<ImageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(100),
          minScale: 0.5,
          maxScale: 4,
          child: Image.file(File(widget.imagePath),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}