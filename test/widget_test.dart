import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workshop_flutter__4ei3/main.dart';

void main() {
  testWidgets('login form validates then opens the store', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenue sur G-STORE'), findsOneWidget);

    await tester.tap(find.text('Se connecter'));
    await tester.pump();

    expect(find.text('Veuillez saisir votre adresse e-mail.'), findsOneWidget);
    expect(find.text('Veuillez saisir votre mot de passe.'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Adresse e-mail'),
      'test@gstore.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Mot de passe'),
      'password',
    );
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.text('G-STORE'), findsOneWidget);
    expect(find.text('House Of Dead'), findsOneWidget);
  });

  testWidgets('tap on film opens detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Adresse e-mail'),
      'test@gstore.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Mot de passe'),
      'password',
    );
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ice Road'));
    await tester.pumpAndSettle();

    expect(find.text('Ice Road'), findsOneWidget);
    expect(find.text('250 DT'), findsOneWidget);
    expect(find.text('Acheter'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_basket), findsOneWidget);
  });
}
