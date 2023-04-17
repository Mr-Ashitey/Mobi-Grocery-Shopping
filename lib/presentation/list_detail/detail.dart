import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {
  final String listTitle;
  const ListDetail({super.key, required this.listTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitle),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("ADD"),
      ),
    );
  }
}
