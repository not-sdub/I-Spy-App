import 'package:flutter/material.dart';
import '../models/item.dart';
import 'item_page.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Grass', imagePath: 'assets/grass.jpg'),
    Item(name: 'Clover', imagePath: 'assets/clover.jpg'),
    Item(name: 'Statue', imagePath: 'assets/statue.jpg'),
    Item(name: 'Boat', imagePath: 'assets/boat.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('I Spy - Find the Item')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return ListTile(
            leading: Image.asset(item.imagePath, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(item.name),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ItemPage(item: item)));
            },
          );
        },
      ),
    );
  }
}