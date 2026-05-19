import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'screens/triage_card_screen.dart';
import 'screens/history_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(B1MedicalTriageApp());
}

class B1MedicalTriageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B1 Medical Triage',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
        '/triage': (context) => TriageCardScreen(),
        '/history': (context) => HistoryScreen(),
      },
    );
  }
}
