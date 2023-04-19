import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/utils/add_item_util.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:provider/provider.dart';

class ListDetail extends StatelessWidget {
  final String groceryId;
  const ListDetail({super.key, required this.groceryId});

  @override
  Widget build(BuildContext context) {
    final groceryListManager = context.read<GroceryListManager>();
    final groceryList =
        context.watch<GroceryListManager>().findGroceryList(groceryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(groceryList!.name ?? ""),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LinearProgressIndicator(
              value: groceryList.items!.isEmpty
                  ? 0
                  : groceryList.numItemsCollected / groceryList.numItems,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 10),
          if (groceryList.items!.isEmpty) const Text("Add item"),
          Expanded(
            child: ListView.separated(
              itemCount: groceryList.items!.length,
              itemBuilder: (_, itemCount) {
                final groceryItem = groceryList.items![itemCount];
                return Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: ValueKey(groceryItem.id),

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
                          context.showItemDialog(
                            isEdit: true,
                            itemName: groceryItem.name!,
                            listId: groceryList.id!,
                            itemId: groceryItem.id,
                          );
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        onPressed: (_) {
                          groceryListManager.removeGroceryItem(
                              groceryList.id!, groceryItem.id!);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: CheckboxListTile(
                    onChanged: (changedValue) {
                      groceryListManager.updateGroceryItemCollectedStatus(
                          groceryList.id!, groceryItem.id!, changedValue!);
                    },
                    value: groceryItem.collected,
                    activeColor: Colors.green,
                    title: Text(
                      groceryItem.name!,
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
          context.showItemDialog(listId: groceryList.id!);
        },
        icon: const Icon(Icons.add),
        label: const Text("ADD"),
      ),
    );
  }
}
