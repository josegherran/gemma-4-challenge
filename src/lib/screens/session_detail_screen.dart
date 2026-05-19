import 'package:flutter/material.dart';
import '../models/triage_session.dart';

class SessionDetailScreen extends StatelessWidget {
  final TriageSession session;
  const SessionDetailScreen({required this.session, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Session Details')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${session.timestamp}'),
            Text('Urgency: ${session.urgency}'),
            SizedBox(height: 16),
            Text('Symptoms:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(session.symptoms),
            SizedBox(height: 16),
            Text('Possible Conditions:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...session.possibleConditions.map((c) => Text('- $c')),
            SizedBox(height: 16),
            Text('Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...session.actions.map((a) => Text('- $a')),
            SizedBox(height: 16),
            Text('Warnings:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...session.warnings.map((w) => Text('- $w')),
            if (session.imagePath != null) ...[
              SizedBox(height: 16),
              Text('Photo:', style: TextStyle(fontWeight: FontWeight.bold)),
              Image.asset(session.imagePath!),
            ],
          ],
        ),
      ),
    );
  }
}
