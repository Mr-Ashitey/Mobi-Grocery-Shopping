import 'package:flutter/material.dart';

import 'presentation/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: "SF Pro"),
      home: const SplashScreen(),
    ),
  );
}
