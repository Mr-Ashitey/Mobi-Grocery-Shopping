import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';

void main() {
  late GroceryListManager groceryListManager;
  GroceryList groceryList = GroceryList(name: "List 1");
  GroceryItem groceryItem = GroceryItem(name: 'Item 1', collected: false);

  setUpAll(() {
    groceryListManager = GroceryListManager();
  });
  group('GroceryListManager tests', () {
    test("addGroceryList should add a grocery list to the manager", () async {
      // expect inital groceryLists to be empty
      expect(groceryListManager.groceryLists, isEmpty);

      // add new grocery list
      groceryListManager.addGroceryList(groceryList);

      // assert grocery list has new list
      expect(groceryListManager.groceryLists, isNotEmpty);
      expect(groceryListManager.findGroceryList(groceryList.id!), groceryList);
    });

    test('removeGroceryList should remove a grocery list from the manager', () {
      // add a grocery list
      groceryListManager.addGroceryList(groceryList);

      // remove groceryList
      groceryListManager.removeGroceryList(groceryList.id!);

      // assert grocery list is empty
      expect(groceryListManager.groceryLists, isEmpty);
      // expect(groceryListManager.findGroceryList(groceryList.id!), equals(null));
    });
    test('renameGroceryList should rename a grocery list in the manager', () {
      // add grocery list
      groceryList.items!.add(groceryItem);
      groceryListManager.addGroceryList(groceryList);

      // rename grocery list name
      groceryListManager.renameGroceryList(groceryList.id!, 'New Name');

      // assert grocery list name is renamed
      expect(groceryListManager.findGroceryList(groceryList.id!)?.name,
          equals('New Name'));
    });

    test('addGroceryItem should add a grocery item to a grocery list', () {
      // add grocery list
      groceryListManager.addGroceryList(groceryList);

      // add grocery item
      groceryListManager.addGroceryItem(groceryList.id!, groceryItem);

      // assert grocery item is added
      expect(
        groceryListManager.groceryLists.first.items!.contains(groceryItem),
        equals(true),
      );
    });

    test('renameGroceryItem should rename a grocery item in a grocery list',
        () {
      // add grocery list with grocery item
      groceryListManager.addGroceryList(groceryList);
      groceryListManager.addGroceryItem(groceryList.id!, groceryItem);

      // rename grocery item
      groceryListManager.renameGroceryItem(
          groceryList.id!, groceryList.items![0].id!, 'New Name');

      // assert grocery item name is changed
      expect(
        groceryListManager.groceryLists.first.items!.first.name,
        equals('New Name'),
      );
    });

    test(
        'Removing a grocery item should update the grocery list and notify listeners',
        () {
      // add grocery list with grocery item
      groceryList.items!.add(groceryItem);
      groceryListManager.addGroceryList(groceryList);

      // remove grocery item from grocery list
      groceryListManager.removeGroceryItem(groceryList.id!, groceryItem.id!);

      // assert grocery item is removed and grocery list is empty
      expect(groceryList.items, isEmpty);
    });
    test(
        'Updating the collected status of a grocery item should update the item and notify listeners',
        () {
      // add grocery list with grocery item
      groceryList.items!.add(groceryItem);
      groceryListManager.addGroceryList(groceryList);

      // update grocery item collected status
      groceryListManager.updateGroceryItemCollectedStatus(
          groceryList.id!, groceryItem.id!, true);

      // assert grocery item collected status is updated
      expect(
          groceryListManager.groceryLists.first.items!.first.collected, isTrue);
    });
  });
}
