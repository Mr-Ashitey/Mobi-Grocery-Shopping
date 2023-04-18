import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';

List<GroceryItem> getCollectedGroceryItems(List<GroceryItem> groceryItems) {
  return groceryItems.where((item) => item.collected!).toList();
}

GroceryList renameGroceryList(int id, String newName) {
  GroceryList listToUpdate = groceryList.firstWhere((list) => list.id == id);
  listToUpdate.name = newName;
  return listToUpdate;
}

void removeGroceryList(int id) {
  return groceryList.removeWhere((list) => list.id == id);
}

int createGroceryList(String name) {
  // Generate a new unique ID for the grocery list
  int id = groceryList.last.id! + 1;

  // Create a new GroceryList object
  GroceryList newList = GroceryList(id: id, name: name);

  // Add the new grocery list to the existing list of grocery lists
  groceryList.add(newList);
  return id;
}

GroceryList? findGroceryList(int groceryId) {
  return groceryList.firstWhere((list) => list.id == groceryId);
}
