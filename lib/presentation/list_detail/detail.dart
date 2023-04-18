import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobi_grocery_shopping/core/helper_functions.dart';
import 'package:mobi_grocery_shopping/core/utils/add_item_util.dart';

class ListDetail extends StatelessWidget {
  final int groceryId;
  const ListDetail({super.key, required this.groceryId});

  @override
  Widget build(BuildContext context) {
    final groceryList = findGroceryList(groceryId);
    final collectedGroceryItems =
        getCollectedGroceryItems(groceryList!.items ?? []);
    return Scaffold(
      appBar: AppBar(
        title: Text(groceryList.name ?? ""),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LinearProgressIndicator(
              value: groceryList.items!.isEmpty
                  ? 0
                  : collectedGroceryItems.length / groceryList.items!.length,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 10),
          if (groceryList.items!.isEmpty) const Text("Add item"),
          Expanded(
            child: ListView.separated(
              itemCount: groceryList.items!.length,
              itemBuilder: (_, itemCount) {
                final groceryItems = groceryList.items![itemCount];
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
                    value: groceryItems.collected,
                    activeColor: Colors.green,
                    title: Text(
                      groceryItems.name!,
                      style: const TextStyle(fontWeight: FontWeight.w700),
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
