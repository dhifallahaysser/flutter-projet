import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workshop_flutter__4ei3/main.dart';

void main() {
  testWidgets('delete button removes a film from the store list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('G-STORE'), findsOneWidget);
    expect(find.text('House Of Dead'), findsOneWidget);
    expect(find.text('The grudge'), findsOneWidget);
    expect(find.text('Ice Road'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.text('Ice Road'), findsNothing);
    expect(find.text('The grudge'), findsOneWidget);
    expect(find.text('House Of Dead'), findsOneWidget);
  });

  testWidgets('tap on film opens detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Ice Road'));
    await tester.pumpAndSettle();

    expect(find.text('Ice Road'), findsOneWidget);
    expect(find.text('250 DT'), findsOneWidget);
    expect(find.text('Acheter'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_basket), findsOneWidget);
  });
}
