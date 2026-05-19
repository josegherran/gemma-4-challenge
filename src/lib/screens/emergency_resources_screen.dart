import 'package:flutter/material.dart';
import '../services/emergency_number_util.dart';

class EmergencyResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emergencyNumber = EmergencyNumberUtil.getEmergencyNumber();
    return Scaffold(
      appBar: AppBar(title: Text('Emergency Resources')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('If you are experiencing a medical emergency, call your local emergency number immediately.'),
            SizedBox(height: 16),
            Text('Your local emergency number:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• $emergencyNumber', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Emergency Numbers by Country:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• US/Canada: 911'),
            Text('• UK: 999'),
            Text('• EU: 112'),
            Text('• ...'),
            SizedBox(height: 24),
            Text('Other Resources:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• Poison Control: 1-800-222-1222 (US)'),
            Text('• Mental Health Crisis: 988 (US)'),
            // Add more as needed
            SizedBox(height: 32),
            Text(
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
