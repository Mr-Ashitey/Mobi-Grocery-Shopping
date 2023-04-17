import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Grocery Lists")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            tileColor: Colors.black12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text(
              "Item 1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
            trailing: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text(
          "NEW LIST",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
