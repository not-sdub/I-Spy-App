import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/item.dart';

class CameraPage extends StatefulWidget {
  final Item item;

  const CameraPage({Key? key, required this.item}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _imageFile;
  bool _showComplete = false;

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _showComplete = true;
      });

      // Show "Complete" for 2 seconds, then go back to home
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    if (_showComplete) {
      return Scaffold(
        appBar: AppBar(title: Text('Complete!')),
        body: Center(child: Text('✅ Task Complete!', style: TextStyle(fontSize: 32))),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Taking photo of ${widget.item.name}')),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}