import 'package:flutter/material.dart';

extension ShowAlert on BuildContext {
  void showAddNewListDialog({Function(String)? onPressed}) {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: this,
        builder: (_) {
          return AlertDialog(
            title: const Text(
              "New List Name",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            content: TextField(
              key: const Key('add_new_list'),
              controller: controller,
              cursorColor: Colors.black,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            actions: [
              TextButton.icon(
                  key: const Key('add_new_list_btn'),
                  onPressed: () {
                    // check if text is empty
                    if (controller.text.isEmpty) {
                      return;
                    }
                    onPressed!(controller.text);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Add New List",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }
}
