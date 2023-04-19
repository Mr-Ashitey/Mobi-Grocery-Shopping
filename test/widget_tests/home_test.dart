import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_grocery_shopping/core/model/grocery_model.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:mobi_grocery_shopping/presentation/home_screen/home.dart';
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

  testWidgets('displays screen placeholder when groceryLists is empty',
      (WidgetTester tester) async {
    await tester.pumpApp(const Home());

    expect(find.text('Start Shopping...'), findsOneWidget);
  });

  testWidgets('displays grocery lists when groceryLists is not empty',
      (WidgetTester tester) async {
    await tester.pumpApp(const Home(), groceryListManager);

    expect(find.text('List 1'), findsOneWidget);
  });
  testWidgets('when grocery list is tapped, navigate to detail screen',
      (WidgetTester tester) async {
    await tester.pumpApp(const Home(), groceryListManager);

    await tester.tap(find.text('List 1'));
    await tester.pumpAndSettle();

    expect(find.byType(ListDetail), findsOneWidget);
  });

  group('More/Options button on grocery list', () {
    final renameGroceryListBtn = find.byKey(const Key('rename_grocery_list'));
    final deleteGroceryListBtn = find.byKey(const Key('delete_grocery_list'));
    final groceryListNameTextField = find.byKey(const Key('grocery_list_name'));
    testWidgets('brings up bottom sheet modal', (WidgetTester tester) async {
      await tester.pumpApp(const Home(), groceryListManager);

      // tap on more on a grocery list
      await tester.tap(find.byIcon(Icons.more_vert_rounded));
      await tester.pump();

      expect(renameGroceryListBtn, findsOneWidget);
      expect(deleteGroceryListBtn, findsOneWidget);
    });
    testWidgets('brings up bottom sheet modal and rename button works',
        (WidgetTester tester) async {
      // create a mock list tile
      await tester.pumpApp(const Home(), groceryListManager);

      // tap on more on a grocery list
      await tester.tap(find.byIcon(Icons.more_vert_rounded));
      await tester.pumpAndSettle();

      await tester.enterText(groceryListNameTextField, "Rename Grocery List");
      await tester.tap(renameGroceryListBtn);
      await tester.pumpAndSettle();

      expect(renameGroceryListBtn, findsNothing);
      expect(find.text("Rename Grocery List"), findsOneWidget);
    });
    testWidgets('brings up bottom sheet modal and delete button works',
        (WidgetTester tester) async {
      // create a mock list tile
      final newGroceryListManager = GroceryListManager();
      newGroceryListManager.addGroceryList(GroceryList(name: "New List"));
      await tester.pumpApp(const Home(), newGroceryListManager);

      // initial grocery list exists
      expect(find.text('New List'), findsOneWidget);

      // tap on more on a grocery list
      await tester.tap(find.byIcon(Icons.more_vert_rounded));
      await tester.pumpAndSettle();

      await tester.tap(deleteGroceryListBtn);
      await tester.pumpAndSettle();

      expect(deleteGroceryListBtn, findsNothing);
      expect(find.text('List 1'), findsNothing);
      expect(find.byType(Home), findsOneWidget);
    });
  });

  testWidgets('displays add new list dialog when FAB is pressed',
      (WidgetTester tester) async {
    await tester.pumpApp(const Home(), groceryListManager);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('New List Name'), findsOneWidget);
    expect(find.text('Add New List'), findsOneWidget);
  });
  testWidgets('add new list and navigate to list detail',
      (WidgetTester tester) async {
    final newListTextField = find.byKey(const Key('add_new_list'));
    await tester.pumpApp(const Home(), groceryListManager);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(newListTextField, "New List");
    await tester.tap(find.byKey(const Key('add_new_list_btn')));
    await tester.pumpAndSettle();

    expect(find.byType(ListDetail), findsOneWidget);
  });
}
