import 'package:flutter/material.dart';

class TriageCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Triage Result')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.redAccent, // Placeholder for urgency color
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'URGENT: Go to ER',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Possible Conditions:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('- Condition 1: Explanation...'),
            Text('- Condition 2: Explanation...'),
            SizedBox(height: 16),
            Text('Immediate Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('- Action 1'),
            Text('- Action 2'),
            SizedBox(height: 16),
            Text('Escalation Warnings:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('- Warning 1'),
            SizedBox(height: 24),
            Text(
              'This is not a medical diagnosis. If in doubt, seek professional care.',
              style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: Text('View History'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }
}
