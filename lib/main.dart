import 'package:flutter/material.dart';

import 'screens/input_screen.dart';
import 'screens/triage_card_screen.dart';
import 'screens/history_screen.dart';
import 'screens/session_detail_screen.dart';
import 'screens/emergency_resources_screen.dart';
import 'theme/app_theme.dart';
import 'package:flutter/foundation.dart';

// Simple localization map
const Map<String, Map<String, String>> kAppStrings = {
  'en': {
    'appTitle': 'B1 Medical Triage',
    'symptomInput': 'Symptom Input',
    'describeSymptoms': 'Describe your symptoms',
    'voiceInput': 'Voice Input',
    'addPhoto': 'Add Photo',
    'assess': 'Assess',
    'triageResult': 'Triage Result',
    'possibleConditions': 'Possible Conditions:',
    'immediateActions': 'Immediate Actions:',
    'triageHistory': 'Triage History',
    'filter': 'Filter:',
    'urgency': 'Urgency',
    'all': 'All',
    'emergencyResources': 'Emergency Resources',
    'emergencyMsg': 'If you are experiencing a medical emergency, call your local emergency number immediately.',
    'mentalHealth': 'Mental Health Crisis: 988 (US)',
    'poisonControl': 'Poison Control: 1-800-222-1222 (US)',
    'disclaimer': 'This app does not provide medical diagnosis or treatment.',
  },
  'es': {
    'appTitle': 'B1 Triaje Médico',
    'symptomInput': 'Entrada de Síntomas',
    'describeSymptoms': 'Describe tus síntomas',
    'voiceInput': 'Entrada de Voz',
    'addPhoto': 'Agregar Foto',
    'assess': 'Evaluar',
    'triageResult': 'Resultado de Triaje',
    'possibleConditions': 'Posibles Condiciones:',
    'immediateActions': 'Acciones Inmediatas:',
    'triageHistory': 'Historial de Triaje',
    'filter': 'Filtrar:',
    'urgency': 'Urgencia',
    'all': 'Todas',
    'emergencyResources': 'Recursos de Emergencia',
    'emergencyMsg': 'Si experimenta una emergencia médica, llame a su número local de emergencias inmediatamente.',
    'mentalHealth': 'Crisis de Salud Mental: 988 (EE.UU.)',
    'poisonControl': 'Control de Envenenamiento: 1-800-222-1222 (EE.UU.)',
    'disclaimer': 'Esta app no proporciona diagnóstico o tratamiento médico.',
  },
  'fr': {
    'appTitle': 'B1 Triage Médical',
    'symptomInput': 'Saisie des Symptômes',
    'describeSymptoms': 'Décrivez vos symptômes',
    'voiceInput': 'Entrée Vocale',
    'addPhoto': 'Ajouter une Photo',
    'assess': 'Évaluer',
    'triageResult': 'Résultat du Triage',
    'possibleConditions': 'Conditions Possibles :',
    'immediateActions': 'Actions Immédiates :',
    'triageHistory': 'Historique du Triage',
    'filter': 'Filtrer :',
    'urgency': 'Urgence',
    'all': 'Toutes',
    'emergencyResources': 'Ressources d’Urgence',
    'emergencyMsg': 'En cas d’urgence médicale, appelez immédiatement votre numéro d’urgence local.',
    'mentalHealth': 'Crise de Santé Mentale : 988 (US)',
    'poisonControl': 'Centre Antipoison : 1-800-222-1222 (US)',
    'disclaimer': 'Cette application ne fournit pas de diagnostic ou de traitement médical.',
  },
  'de': {
    'appTitle': 'B1 Medizinische Triage',
    'symptomInput': 'Symptomeingabe',
    'describeSymptoms': 'Beschreiben Sie Ihre Symptome',
    'voiceInput': 'Spracheingabe',
    'addPhoto': 'Foto hinzufügen',
    'assess': 'Bewerten',
    'triageResult': 'Triage-Ergebnis',
    'possibleConditions': 'Mögliche Bedingungen:',
    'immediateActions': 'Sofortmaßnahmen:',
    'triageHistory': 'Triage-Verlauf',
    'filter': 'Filter:',
    'urgency': 'Dringlichkeit',
    'all': 'Alle',
    'emergencyResources': 'Notfallressourcen',
    'emergencyMsg': 'Bei einem medizinischen Notfall rufen Sie sofort Ihre lokale Notrufnummer an.',
    'mentalHealth': 'Psychische Krise: 988 (US)',
    'poisonControl': 'Giftnotruf: 1-800-222-1222 (US)',
    'disclaimer': 'Diese App stellt keine medizinische Diagnose oder Behandlung dar.',
  },
};

extension AppLocalizations on BuildContext {
  String tr(String key, [String? lang]) {
    final l = lang ?? (ModalRoute.of(this)?.settings.arguments as String?) ?? 'en';
    return kAppStrings[l]?[key] ?? kAppStrings['en']![key] ?? key;
  }
}

void main() {
  runApp(const B1MedicalTriageApp());
}

class B1MedicalTriageApp extends StatefulWidget {
  const B1MedicalTriageApp({super.key});

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
            builder = (context) => _wrapWithAppBar(const InputScreen());
            break;
          case '/triage':
            builder = (context) => _wrapWithAppBar(const TriageCardScreen());
            break;
          case '/history':
            builder = (context) => _wrapWithAppBar(const HistoryScreen());
            break;
          case '/emergency':
            builder = (context) => _wrapWithAppBar(const EmergencyResourcesScreen());
            break;
          default:
            builder = (context) => _wrapWithAppBar(const InputScreen());
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
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.health_and_safety, color: Colors.teal, size: 28),
              ),
            ),
            Builder(
              builder: (context) => Text(
                context.tr('appTitle', _selectedLanguage),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: _highContrast ? Colors.amber : Colors.white,
                  letterSpacing: 1.2,
                ),
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
                boxShadow: const [
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
                    icon: const Icon(Icons.language, color: Colors.teal),
                    items: const [
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
                    padding: const EdgeInsets.all(8),
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
                      padding: const EdgeInsets.all(8),
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
        child: Builder(
          builder: (context) => child,
        ),
      ),
    );
  }
}
