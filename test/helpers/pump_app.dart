import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:provider/provider.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget screen,
      [GroceryListManager? groceryListManagerProvider]) {
    return pumpWidget(
      ChangeNotifierProvider.value(
        value: groceryListManagerProvider ?? GroceryListManager(),
        child: MaterialApp(
          home: screen,
        ),
      ),
    );
  }
}
