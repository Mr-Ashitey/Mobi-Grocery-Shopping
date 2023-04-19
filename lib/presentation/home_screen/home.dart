import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/utils/alert.dart';
import 'package:mobi_grocery_shopping/core/utils/bottom_modal.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:provider/provider.dart';

import '../list_detail/detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final groceryManager = context.read<GroceryListManager>();
    final groceryLists = context.watch<GroceryListManager>().groceryLists;
    return Scaffold(
      appBar: AppBar(title: const Text("My Grocery Lists")),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: groceryLists.length,
        itemBuilder: (_, itemCount) {
          final groceryItems = groceryLists[itemCount].items;

          return ListTile(
            tileColor: Colors.black12,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              groceryLists[itemCount].name ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            subtitle: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    value: groceryItems!.isEmpty
                        ? 0
                        : groceryLists[itemCount].numItemsCollected /
                            groceryLists[itemCount].numItems,
                    minHeight: 5,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${groceryLists[itemCount].numItemsCollected} / ${groceryLists[itemCount].numItems}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {
                context.showItemOptions(
                    groceryId: groceryLists[itemCount].id ?? "",
                    itemName: groceryLists[itemCount].name ?? "");
              },
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      ListDetail(groceryId: groceryLists[itemCount].id ?? "")));
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.showAddNewListDialog(onPressed: (newName) {
            // create new grocery list
            final newGroceryList = GroceryList(name: newName);
            groceryManager.addGroceryList(newGroceryList);

            // move to list detail
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => ListDetail(groceryId: newGroceryList.id!)));
          });
        },
        icon: const Icon(Icons.add),
        label: const Text("NEW LIST"),
      ),
    );
  }
}
