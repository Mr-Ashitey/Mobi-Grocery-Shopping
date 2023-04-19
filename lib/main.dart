import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/core/viewModels/grocery_manager.dart';
import 'package:provider/provider.dart';

import 'presentation/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: GroceryListManager(),
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "SF Pro",
            appBarTheme: const AppBarTheme(color: Colors.black),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.black,
              extendedTextStyle: TextStyle(fontWeight: FontWeight.w600),
            )),
        home: const SplashScreen(),
      ),
    ),
  );
}
