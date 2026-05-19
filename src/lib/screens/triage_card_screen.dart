import '../services/perf_timer.dart';
import 'package:flutter/material.dart';

class TriageCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Triage Result')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Semantics(
          container: true,
          label: 'Triage result screen',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                label: 'Urgency: urgent, go to ER',
                child: Container(
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
              ),
              SizedBox(height: 24),
              Semantics(
                label: 'Possible conditions',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Possible Conditions:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Condition 1: Explanation...'),
                    Text('- Condition 2: Explanation...'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Semantics(
                label: 'Immediate actions',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Immediate Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Action 1'),
                    Text('- Action 2'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Semantics(
                label: 'Escalation warnings',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Escalation Warnings:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Warning 1'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Semantics(
                label: 'Disclaimer: This is not a medical diagnosis. If in doubt, seek professional care.',
                child: Text(
                  'This is not a medical diagnosis. If in doubt, seek professional care.',
                  style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
                ),
              ),
              Spacer(),
              Semantics(
                button: true,
                label: 'View history button',
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/history');
                  },
                  child: Text('View History'),
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual urgency from model/session
    final urgency = 'red';
    WidgetsBinding.instance.addPostFrameCallback((_) => _triggerHaptic(urgency));

    // Simulate timing the triage/model response (stub)
    PerfTimer.time('triage_response', () async => await Future.delayed(Duration(milliseconds: 1200)));

    return Scaffold(
      appBar: AppBar(title: Text('Triage Result')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Semantics(
          container: true,
          label: 'Triage result screen',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                label: 'Urgency: urgent, go to ER',
                child: Container(
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
              ),
              SizedBox(height: 24),
              Semantics(
                label: 'Possible conditions',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Possible Conditions:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Condition 1: Explanation...'),
                    Text('- Condition 2: Explanation...'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Semantics(
                label: 'Immediate actions',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Immediate Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Action 1'),
                    Text('- Action 2'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Semantics(
                label: 'Escalation warnings',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Escalation Warnings:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Warning 1'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Semantics(
                label: 'Disclaimer: This is not a medical diagnosis. If in doubt, seek professional care.',
                child: Text(
                  'This is not a medical diagnosis. If in doubt, seek professional care.',
                  style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
                ),
              ),
              Spacer(),
              Semantics(
                button: true,
                label: 'View history button',
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/history');
                  },
                  child: Text('View History'),
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
