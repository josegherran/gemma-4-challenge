import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:b1_medical_triage/screens/input_screen.dart';

void main() {
  testWidgets('InputScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: InputScreen()));
    expect(find.text('Symptom Input'), findsOneWidget);
    expect(find.text('Assess'), findsOneWidget);
    expect(find.byIcon(Icons.mic), findsOneWidget);
    expect(find.byIcon(Icons.photo_camera), findsOneWidget);
  });
}
