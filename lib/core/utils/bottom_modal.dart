import 'package:flutter/material.dart';

extension ShowBottomModal on BuildContext {
  void showItemOptions({required String itemName}) {
    showModalBottomSheet(
        context: this,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(this).size.height / 3),
        builder: (_) {
          return Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                "Manage List",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Text(
                itemName,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text("Rename")),
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 176, 53, 45)),
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete")),
                ],
              )
            ],
          );
        });
  }
}
