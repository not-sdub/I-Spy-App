import 'dart:io';

import 'package:flutter/material.dart';
import '../models/item.dart';
import 'camera_page.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(item.imagePath, width: 200, height: 200, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(item.name, style: TextStyle(fontSize: 24)),
          SizedBox(height: 30),
          ElevatedButton(
            child: Text('Take Photo'),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CameraPage(item: item)));
            },
          )
        ],
      ),
    );
  }
}