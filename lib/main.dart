import 'package:flutter/material.dart';

import 'presentation/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          fontFamily: "SF Pro",
          appBarTheme: const AppBarTheme(color: Colors.black),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
            extendedTextStyle: TextStyle(fontWeight: FontWeight.w600),
          )),
      home: const SplashScreen(),
    ),
  );
}
