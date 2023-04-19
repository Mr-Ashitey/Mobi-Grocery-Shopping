import 'package:flutter/material.dart';

import '../model/grocery_model.dart';

class GroceryListManager extends ChangeNotifier {
  final List<GroceryList> _groceryLists = [];

  // getter to get grocery lists
  List<GroceryList> get groceryLists => [..._groceryLists];

  // Adds a new grocery list to the grocery list manager and notifies listeners of the change.
  void addGroceryList(GroceryList groceryList) {
    _groceryLists.add(groceryList);
    notifyListeners();
  }

  // Removes the grocery list with the given ID from the list of grocery lists.
  void removeGroceryList(String id) {
    _groceryLists.removeWhere((groceryList) => groceryList.id == id);
    notifyListeners();
  }

  // Renames the grocery list with the given ID to the new name.
  void renameGroceryList(String id, String newName) {
    _groceryLists.firstWhere((groceryList) => groceryList.id == id).name =
        newName;
    notifyListeners();
  }

  // Renames the grocery item with the given ID in the list with the given ID to the new name.
  // Throws an exception if the item ID is not found in the list.
  void renameGroceryItem(String listId, String itemId, String newName) {
    final groceryList = _groceryLists.firstWhere((list) => list.id == listId);
    final itemIndex =
        groceryList.items!.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      groceryList.items![itemIndex].name = newName;
      notifyListeners();
    } else {
      // throw Exception(
      //     'Item with ID $itemId not found in grocery list with ID $listId');
    }
  }

  // Add a grocery item to the specified grocery list
  void addGroceryItem(String listId, GroceryItem item) {
    _groceryLists
        .firstWhere((groceryList) => groceryList.id == listId)
        .items!
        .add(item);
    notifyListeners();
  }

  // Remove a grocery item from the specified grocery list
  void removeGroceryItem(String listId, String itemId) {
    _groceryLists
        .firstWhere((groceryList) => groceryList.id == listId)
        .items!
        .removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  // Update the collected status of a grocery item in the specified grocery list
  void updateGroceryItemCollectedStatus(
      String listId, String itemId, bool collected) {
    final groceryList = _groceryLists.firstWhere((list) => list.id == listId);

    // Find the grocery item with the specified ID and update its collected status
    final item = groceryList.items!.firstWhere((item) => item.id == itemId);
    item.collected = collected;

    notifyListeners();
  }

  // Find the grocery list with the specified ID
  GroceryList? findGroceryList(String groceryId) {
    return _groceryLists.firstWhere((list) => list.id == groceryId);
  }

  // Get a list of all grocery items in all grocery lists
  List<GroceryItem> getAllGroceryItems() {
    return _groceryLists.expand((list) => list.items!).toList();
  }
}
