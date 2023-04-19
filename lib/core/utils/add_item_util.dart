import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:provider/provider.dart';

extension ShowAlert on BuildContext {
  void showItemDialog(
      {bool isEdit = false,
      String itemName = '',
      String? listId,
      String? itemId}) {
    showDialog(
        context: this,
        builder: (_) {
          return AlertDialog(
            title: Text(
              isEdit ? "Edit Item" : "Add Item",
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            content: Autocomplete<GroceryItem>(
              displayStringForOption: (groceryItem) => groceryItem.name!,
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<GroceryItem>.empty();
                }
                final allGroceryItems =
                    read<GroceryListManager>().getAllGroceryItems();
                return allGroceryItems
                    .where((groceryItem) => groceryItem.name!
                        .toLowerCase()
                        .startsWith(textEditingValue.text.toLowerCase()))
                    .toList();
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                textEditingController.text = itemName;
                return TextFormField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  cursorColor: Colors.black,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                  onChanged: (value) => itemName = value,
                );
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 2,
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: ListView.builder(
                          itemCount: options.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (_, index) {
                            final option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
                                itemName = option.name!;
                              },
                              child: ListTile(
                                title: Text(option.name!),
                              ),
                            );
                          }),
                    ),
                  ),
                );
              },
            ),
            // content: const TextField(
            //   cursorColor: Colors.black,
            //   textCapitalization: TextCapitalization.words,
            //   decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.black))),
            // ),
            actions: [
              TextButton.icon(
                  onPressed: () {
                    if (itemName.isEmpty) {
                      return;
                    }
                    if (isEdit) {
                      read<GroceryListManager>()
                          .renameGroceryItem(listId!, itemId!, itemName);
                      Navigator.of(this).pop();
                      return;
                    }
                    final newGroceryItem = GroceryItem(name: itemName);
                    read<GroceryListManager>()
                        .addGroceryItem(listId!, newGroceryItem);
                    Navigator.of(this).pop();
                  },
                  icon: const Icon(
                    Icons.local_grocery_store_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    isEdit ? "Edit Shopping Item" : "Add Shopping Item",
                    style: const TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }
}
