import 'package:flutter/material.dart';
import '../services/local_logger.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('symptomInput'))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Semantics(
          container: true,
          label: context.tr('symptomInput'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                label: context.tr('describeSymptoms'),
                textField: true,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: context.tr('describeSymptoms'),
                    border: const OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Semantics(
                    button: true,
                    label: context.tr('voiceInput'),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mic),
                      label: Text(context.tr('voiceInput')),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(140, 48)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Semantics(
                    button: true,
                    label: context.tr('addPhoto'),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_camera),
                      label: Text(context.tr('addPhoto')),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(140, 48)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Semantics(
                button: true,
                label: context.tr('assess'),
                child: ElevatedButton(
                  onPressed: () async {
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
                style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
