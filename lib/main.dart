import 'package:flutter/material.dart';

import 'presentation/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          fontFamily: "SF Pro",
          appBarTheme: const AppBarTheme(color: Colors.black)),
      home: const SplashScreen(),
    ),
  );
}
