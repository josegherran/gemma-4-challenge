import 'package:flutter/material.dart';
import '../services/emergency_number_util.dart';

class EmergencyResourcesScreen extends StatelessWidget {
  const EmergencyResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emergencyNumber = EmergencyNumberUtil.getEmergencyNumber();
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Resources')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('If you are experiencing a medical emergency, call your local emergency number immediately.'),
            const SizedBox(height: 16),
            const Text('Your local emergency number:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• $emergencyNumber', style: const TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Emergency Numbers by Country:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('• US/Canada: 911'),
            const Text('• UK: 999'),
            const Text('• EU: 112'),
            const Text('• ...'),
            const SizedBox(height: 24),
            const Text('Other Resources:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('• Poison Control: 1-800-222-1222 (US)'),
            const Text('• Mental Health Crisis: 988 (US)'),
            // Add more as needed
            const SizedBox(height: 32),
            const Text(
              'Disclaimer: This is not a medical diagnosis. If in doubt, seek professional care.',
              style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
