import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/core/utils/alert.dart';
import 'package:mobi_grocery_shopping/core/utils/bottom_modal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Grocery Lists")),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (_, itemCount) {
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            tileColor: Colors.black12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              "Item $itemCount",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            subtitle: Row(
              children: const [
                SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    value: 0.5,
                    minHeight: 5,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "2 / 2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {
                context.showItemOptions(itemName: "Item $itemCount");
              },
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.showAddNewListDialog(controller: null, onPressed: null);
        },
        icon: const Icon(Icons.add),
        label: const Text(
          "NEW LIST",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
