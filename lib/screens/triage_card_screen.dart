import '../services/perf_timer.dart';
import 'package:flutter/material.dart';

class TriageCardScreen extends StatelessWidget {
  const TriageCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('triageResult'))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Semantics(
          container: true,
          label: context.tr('triageResult'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                label: context.tr('urgency'),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.redAccent, // Placeholder for urgency color
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'URGENT: Go to ER', // TODO: Localize urgency text if needed
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Semantics(
                label: context.tr('possibleConditions'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.tr('possibleConditions'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('- Condition 1: Explanation...'),
                    const Text('- Condition 2: Explanation...'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Semantics(
                label: context.tr('immediateActions'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.tr('immediateActions'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('- Action 1'),
                    const Text('- Action 2'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Semantics(
                label: 'Escalation warnings',
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Escalation Warnings:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('- Warning 1'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Semantics(
                label: 'Disclaimer: This is not a medical diagnosis. If in doubt, seek professional care.',
                child: const Text(
                  'This is not a medical diagnosis. If in doubt, seek professional care.',
                  style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
                ),
              ),
              const Spacer(),
              Semantics(
                button: true,
                label: 'View history button',
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/history'),
                  child: const Text('View History'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
