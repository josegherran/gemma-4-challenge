import 'package:flutter/material.dart';
import '../services/local_logger.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Symptom Input')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Semantics(
          container: true,
          label: 'Symptom input screen',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                label: 'Symptom description input field',
                textField: true,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Describe your symptoms',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Semantics(
                    button: true,
                    label: 'Voice input button',
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mic),
                      label: const Text('Voice Input'),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(140, 48)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Semantics(
                    button: true,
                    label: 'Add photo button',
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_camera),
                      label: const Text('Add Photo'),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(140, 48)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Semantics(
                button: true,
                label: 'Assess button',
                child: ElevatedButton(
                  onPressed: () {
                    // Simulate input error (stub)
                    const hasInputError = false; // Set to true to test
                    if (hasInputError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter your symptoms before proceeding.')),
                      );
                      await LocalLogger.logError('Input error: symptoms missing');
                      return;
                    }
                    Navigator.pushNamed(context, '/triage');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Assess'),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Disclaimer: This is not a medical diagnosis. If in doubt, seek professional care.',
                style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
