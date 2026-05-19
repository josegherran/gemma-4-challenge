import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:b1_medical_triage/screens/history_screen.dart';

void main() {
  testWidgets('HistoryScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HistoryScreen()));
    expect(find.text('Triage History'), findsOneWidget);
    expect(find.byType(ListTile), findsWidgets);
  });
}
