import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'screens/triage_card_screen.dart';
import 'screens/history_screen.dart';
import 'screens/session_detail_screen.dart';
import 'screens/emergency_resources_screen.dart';
import 'theme/app_theme.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(B1MedicalTriageApp());
}

class B1MedicalTriageApp extends StatefulWidget {
  @override
  State<B1MedicalTriageApp> createState() => _B1MedicalTriageAppState();
}

class _B1MedicalTriageAppState extends State<B1MedicalTriageApp> {
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
      showPerformanceOverlay: _showPerfOverlay,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (context) => _wrapWithAppBar(InputScreen());
            break;
          case '/triage':
            builder = (context) => _wrapWithAppBar(TriageCardScreen());
            break;
          case '/history':
            builder = (context) => _wrapWithAppBar(HistoryScreen());
            break;
          case '/emergency':
            builder = (context) => _wrapWithAppBar(EmergencyResourcesScreen());
            break;
          default:
            builder = (context) => _wrapWithAppBar(InputScreen());
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  Widget _wrapWithAppBar(Widget child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _highContrast ? Colors.black : Colors.teal[700],
        elevation: 4,
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.health_and_safety, color: Colors.teal, size: 28),
              ),
            ),
            Text(
              'B1 Medical Triage',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: _highContrast ? Colors.amber : Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    icon: Icon(Icons.language, color: Colors.teal),
                    items: [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'es', child: Text('Español')),
                      DropdownMenuItem(value: 'fr', child: Text('Français')),
                      DropdownMenuItem(value: 'de', child: Text('Deutsch')),
                    ],
                    onChanged: _changeLanguage,
                    style: TextStyle(fontSize: 16, color: Colors.teal[900], fontWeight: FontWeight.w600),
                    dropdownColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Tooltip(
              message: _highContrast ? 'Normal' : 'High Contrast',
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: _toggleContrast,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _highContrast ? Colors.amber : Colors.teal[100],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      Icons.contrast,
                      color: _highContrast ? Colors.black : Colors.teal[800],
                      size: 26,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (!kReleaseMode)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Tooltip(
                message: _showPerfOverlay ? 'Hide Perf' : 'Show Perf',
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: _togglePerfOverlay,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        Icons.speed,
                        color: Colors.deepPurple[800],
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _highContrast
                ? [Colors.black, Colors.grey[900]!]
                : [Colors.teal[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}
