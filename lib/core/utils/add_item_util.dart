import 'package:flutter/material.dart';

extension ShowAlert on BuildContext {
  void showAddItemDialog() {
    showDialog(
        context: this,
        builder: (_) {
          return AlertDialog(
            title: const Text(
              "Add Item",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            content: Autocomplete(
              // displayStringForOption: (option) => option.name,
              optionsBuilder: (textEditingValue) {
                return [textEditingValue.text];
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) =>
                  TextField(
                controller: textEditingController,
                focusNode: focusNode,
                cursorColor: Colors.black,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              optionsViewBuilder: (context, onSelected, options) => Align(
                alignment: Alignment.topLeft,
                child: Material(
                  child: Container(
                    width: 300,
                    // color: Colors.teal,
                    child: ListView.builder(
                        itemCount: 10,
                        padding: const EdgeInsets.all(10.0),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () => onSelected("Data"),
                            child: const ListTile(
                              title: Text("Data"),
                            ),
                          );
                        }),
                  ),
                ),
              ),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.local_grocery_store_rounded,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Add Shopping Item",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }
}
