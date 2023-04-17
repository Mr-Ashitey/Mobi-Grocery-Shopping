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
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const LinearProgressIndicator(
              value: 0.5,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 8,
              itemBuilder: (_, itemCount) {
                return CheckboxListTile(
                  onChanged: (changedValue) {},
                  value: true,
                  activeColor: Colors.green,
                  title: const Text(
                    "Bread",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  secondary: const Icon(Icons.local_grocery_store_rounded),
                  checkboxShape: const CircleBorder(),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("ADD"),
      ),
    );
  }
}
