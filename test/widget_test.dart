import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workshop_flutter__4ei3/main.dart';

void main() {
  testWidgets('login form validates then opens the store', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Sign In'), findsOneWidget);

    await tester.tap(find.text('SIGN IN'));
    await tester.pump();

    expect(find.text('Required field'), findsNWidgets(2));

    await tester.enterText(find.byType(TextFormField).at(0), 'test@gstore.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.text('SIGN IN'));
    await tester.pumpAndSettle();

    expect(find.text('G-STORE'), findsOneWidget);
    expect(find.text('House Of Dead'), findsOneWidget);
  });

  testWidgets('create account opens sign up form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('CREATE AN ACCOUNT'));
    await tester.pumpAndSettle();

    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.text('Already have an account ?'), findsOneWidget);
  });

  testWidgets('tap on film opens detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextFormField).at(0), 'test@gstore.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.text('SIGN IN'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ice Road'));
    await tester.pumpAndSettle();

    expect(find.text('Ice Road'), findsOneWidget);
    expect(find.text('250 DT'), findsOneWidget);
    expect(find.text('Acheter'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_basket), findsOneWidget);
  });
}
