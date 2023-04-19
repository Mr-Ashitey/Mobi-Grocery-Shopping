import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:mobi_grocery_shopping/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(String route) {
    return pumpWidget(
      ChangeNotifierProvider.value(
        value: GroceryListManager(),
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );
  }
}
