
import 'package:flutter/material.dart';

import 'screens/input_screen.dart';
import 'screens/triage_card_screen.dart';
import 'screens/history_screen.dart';
import 'screens/session_detail_screen.dart';
import 'screens/emergency_resources_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(B1MedicalTriageApp());
}

class B1MedicalTriageApp extends StatefulWidget {
  @override
  State<B1MedicalTriageApp> createState() => _B1MedicalTriageAppState();
}


  String _selectedLanguage = 'en';
  bool _highContrast = false;
  bool _showPerfOverlay = false;

  void _toggleContrast() => setState(() => _highContrast = !_highContrast);
  void _togglePerfOverlay() => setState(() => _showPerfOverlay = !_showPerfOverlay);
  void _changeLanguage(String? lang) {
    if (lang != null) setState(() => _selectedLanguage = lang);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B1 Medical Triage',
      theme: _highContrast ? AppTheme.highContrastTheme : AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
        '/triage': (context) => TriageCardScreen(),
        '/history': (context) => HistoryScreen(),
        '/emergency': (context) => EmergencyResourcesScreen(),
        // '/session/:id' handled via MaterialPageRoute in history_screen.dart
      },
      showPerformanceOverlay: _showPerfOverlay,
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Positioned(
              top: 32,
              right: 16,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DropdownButton<String>(
                      value: _selectedLanguage,
                      icon: Icon(Icons.language),
                      underline: Container(height: 2, color: Colors.transparent),
                      items: [
                        DropdownMenuItem(value: 'en', child: Text('English')),
                        DropdownMenuItem(value: 'es', child: Text('Español')),
                        DropdownMenuItem(value: 'fr', child: Text('Français')),
                        DropdownMenuItem(value: 'de', child: Text('Deutsch')),
                        // Add more languages as needed
                      ],
                      onChanged: _changeLanguage,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      dropdownColor: Colors.white,
                    ),
                    SizedBox(height: 12),
                    FloatingActionButton.extended(
                      heroTag: 'contrast_toggle',
                      onPressed: _toggleContrast,
                      icon: Icon(Icons.contrast),
                      label: Text(_highContrast ? 'Normal' : 'High Contrast'),
                      backgroundColor: _highContrast ? Colors.amber : Colors.teal,
                      foregroundColor: _highContrast ? Colors.black : Colors.white,
                      elevation: 2,
                    ),
                    SizedBox(height: 12),
                    if (!bool.fromEnvironment('dart.vm.product'))
                      FloatingActionButton.extended(
                        heroTag: 'perf_toggle',
                        onPressed: _togglePerfOverlay,
                        icon: Icon(Icons.speed),
                        label: Text(_showPerfOverlay ? 'Hide Perf' : 'Show Perf'),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        elevation: 2,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
