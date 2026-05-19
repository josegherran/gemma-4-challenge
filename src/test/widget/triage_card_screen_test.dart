import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:b1_medical_triage/screens/triage_card_screen.dart';

void main() {
  testWidgets('TriageCardScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TriageCardScreen()));
    expect(find.text('Triage Result'), findsOneWidget);
    expect(find.text('URGENT: Go to ER'), findsOneWidget);
    expect(find.text('View History'), findsOneWidget);
  });
}
