import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/core/helper_functions.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/utils/alert.dart';
import 'package:mobi_grocery_shopping/core/utils/bottom_modal.dart';

import '../list_detail/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Grocery Lists")),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: groceryList.length,
        itemBuilder: (_, itemCount) {
          final groceryItems = groceryList[itemCount].items;
          final collectedGroceryItems =
              getCollectedGroceryItems(groceryItems ?? []);
          return ListTile(
            tileColor: Colors.black12,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              groceryList[itemCount].name ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            subtitle: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    value: collectedGroceryItems.length / groceryItems!.length,
                    minHeight: 5,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${collectedGroceryItems.length} / ${groceryItems.length}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {
                context.showItemOptions(
                    groceryId: groceryList[itemCount].id ?? 0,
                    itemName: groceryList[itemCount].name ?? "");
              },
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ListDetail(
                      listTitle: groceryList[itemCount].name ?? "")));
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // clear controller of any values
          textController.clear();

          context.showAddNewListDialog(
              controller: textController,
              onPressed: () {
                // check if text is empty
                if (textController.text.isEmpty) {
                  return;
                }
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => ListDetail(
                          listTitle: textController.text,
                        )));
              });
        },
        icon: const Icon(Icons.add),
        label: const Text("NEW LIST"),
      ),
    );
  }
}
