import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobi_grocery_shopping/presentation/home_screen/home.dart';
import 'package:mobi_grocery_shopping/presentation/splash_screen.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets(
      'Splash Screen Build Successful and Navigate to Home After 3 Seconds',
      (WidgetTester tester) async {
    // Build the splash screen widget
    await tester.pumpApp(const SplashScreen());

    // Verify that the app logo and text is displayed on the screen
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);

    // Wait for 3 seconds (or the duration specified in the splash screen widget)
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Verify that the home screen is displayed after the splash screen
    expect(find.byType(Home), findsOneWidget);
  });
}
