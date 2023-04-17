import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
