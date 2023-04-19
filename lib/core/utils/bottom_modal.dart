import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/core/utils/notification.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:provider/provider.dart';

extension ShowBottomModal on BuildContext {
  void showItemOptions({required String groceryId, required String itemName}) {
    TextEditingController textEditingController =
        TextEditingController(text: itemName);
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  key: const Key('grocery_list_name'),
                  controller: textEditingController,
                  cursorColor: Colors.black,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      key: const Key('rename_grocery_list'),
                      onPressed: () {
                        if (itemName == textEditingController.text) {
                          return;
                        }
                        // rename grocery list
                        read<GroceryListManager>().renameGroceryList(
                            groceryId, textEditingController.text);

                        showNotification(message: "Renamed successfully");
                        Navigator.pop(this);
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text("Rename")),
                  ElevatedButton.icon(
                      key: const Key('delete_grocery_list'),
                      onPressed: () {
                        // remove grocery list
                        read<GroceryListManager>().removeGroceryList(groceryId);

                        showNotification(message: "Deleted successfully");
                        Navigator.pop(this);
                      },
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
