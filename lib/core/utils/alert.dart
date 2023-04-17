import 'package:flutter/material.dart';

extension ShowAlert on BuildContext {
  void showAddNewListDialog(
      {TextEditingController? controller, VoidCallback? onPressed}) {
    showDialog(
        context: this,
        builder: (_) {
          return AlertDialog(
            title: const Text(
              "New List Name",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            content: TextField(
              controller: controller,
              cursorColor: Colors.black,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            actions: [
              TextButton.icon(
                  onPressed: onPressed,
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
