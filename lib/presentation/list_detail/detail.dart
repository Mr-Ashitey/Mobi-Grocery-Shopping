import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobi_grocery_shopping/core/utils/add_item_util.dart';

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
                return Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.
                  endActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const BehindMotion(),

                    // A pane can dismiss the Slidable.
                    // dismissible: DismissiblePane(onDismissed: () {}),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (_) {
                          context.showItemDialog(isEdit: true);
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: CheckboxListTile(
                    onChanged: (changedValue) {},
                    value: true,
                    activeColor: Colors.green,
                    title: const Text(
                      "Bread",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    secondary: const Icon(Icons.local_grocery_store_rounded),
                    checkboxShape: const CircleBorder(),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.showItemDialog();
        },
        icon: const Icon(Icons.add),
        label: const Text("ADD"),
      ),
    );
  }
}
