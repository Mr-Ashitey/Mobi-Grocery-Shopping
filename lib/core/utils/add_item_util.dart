import 'package:flutter/material.dart';

extension ShowAlert on BuildContext {
  void showItemDialog({bool isEdit = false}) {
    showDialog(
        context: this,
        builder: (_) {
          return AlertDialog(
            title: Text(
              isEdit ? "Edit Item" : "Add Item",
              style: const TextStyle(fontWeight: FontWeight.w800),
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
                  child: SizedBox(
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
                  label: Text(
                    isEdit ? "Edit Shopping Item" : "Add Shopping Item",
                    style: const TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }
}
