import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobi_grocery_shopping/presentation/home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHomeScreenAfter3Seconds();
    super.initState();
  }

// function to display splash screen for 3 seconds
  void navigateToHomeScreenAfter3Seconds() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopping_basket_rounded,
              size: 90,
            ),
            SizedBox(height: 10),
            Text(
              "MOBI GROCERY SHOPPING",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                wordSpacing: 2,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
