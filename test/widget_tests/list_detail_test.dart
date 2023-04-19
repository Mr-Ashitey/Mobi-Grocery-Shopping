import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:mobi_grocery_shopping/presentation/list_detail/detail.dart';

import '../helpers/pump_app.dart';

void main() {
  late GroceryListManager groceryListManager;
  GroceryList groceryList = GroceryList(name: "List 1");
  GroceryItem groceryItem = GroceryItem(name: 'Item 1', collected: false);

  setUpAll(() {
    groceryListManager = GroceryListManager();
    groceryList.items!.add(groceryItem);
    groceryListManager.addGroceryList(groceryList);
  });

  testWidgets('renders list detail correctly', (tester) async {
    await tester.pumpApp(
        ListDetail(groceryId: groceryList.id!), groceryListManager);

    // Verify that the list name is displayed in the app bar.
    expect(find.text(groceryList.name!), findsOneWidget);

    // Verify that the checkbox list tiles are displayed for each grocery item.
    expect(find.byType(CheckboxListTile),
        findsNWidgets(groceryList.items!.length));

    // Tap the add button and verify that the add item dialog is displayed.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Add Item'), findsOneWidget);
  });
  testWidgets('can add a new grocery item', (tester) async {
    await tester.pumpApp(
        ListDetail(groceryId: groceryList.id!), groceryListManager);

    // Tap the add button to display the add item dialog.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Add Item'), findsOneWidget);

    // Enter the item name and tap the save button.
    await tester.enterText(find.byType(TextField), 'New Item');
    await tester.tap(find.byKey(const Key('new_item_btn')));
    await tester.pumpAndSettle();

    // Verify that the new grocery item is displayed in the list.
    expect(find.text('New Item'), findsOneWidget);
  });
  testWidgets('change grocery item collected status', (tester) async {
    await tester.pumpApp(
        ListDetail(groceryId: groceryList.id!), groceryListManager);

    expect(groceryItem.collected!, false);
    await tester.tap(find.byType(CheckboxListTile).first);
    await tester.pump();

    expect(groceryItem.collected!, true);
  });
  testWidgets('can edit an existing grocery item', (tester) async {
    await tester.pumpApp(
        ListDetail(groceryId: groceryList.id!), groceryListManager);

    expect(find.text(groceryItem.name!), findsOneWidget);
    await tester.drag(find.text(groceryItem.name!), const Offset(-500, 0));
    await tester.pumpAndSettle();

    final editIcon = find.byIcon(Icons.edit);
    expect(editIcon, findsOneWidget);

    await tester.tap(editIcon);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), "Renamed grocery item");
    await tester.tap(find.byKey(const Key('new_item_btn')));
    await tester.pumpAndSettle();

    // Tap the add button to display the add item dialog.
    expect(find.text('Renamed grocery item'), findsOneWidget);
  });
  testWidgets('can delete an existing grocery item', (tester) async {
    await tester.pumpApp(
        ListDetail(groceryId: groceryList.id!), groceryListManager);

    expect(find.text(groceryItem.name!), findsOneWidget);
    await tester.drag(find.text(groceryItem.name!), const Offset(-500, 0));
    await tester.pumpAndSettle();

    final deleteIcon = find.byIcon(Icons.delete);
    expect(deleteIcon, findsOneWidget);
    await tester.tap(deleteIcon);
    await tester.pumpAndSettle();

    // Tap the add button to display the add item dialog.
    expect(find.text(groceryItem.name!), findsNothing);
  });
}
