import 'package:flutter/material.dart';

class EmergencyResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergency Resources')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emergency Resources', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 16),
            Text('If you are experiencing a medical emergency, call your local emergency number immediately.'),
            SizedBox(height: 16),
            Text('Mental Health Crisis: 988 (US)'),
            Text('Poison Control: 1-800-222-1222 (US)'),
            // Add more resources as needed
            SizedBox(height: 24),
            Text('This app does not provide medical diagnosis or treatment.'),
          ],
        ),
      ),
    );
  }
}
