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
