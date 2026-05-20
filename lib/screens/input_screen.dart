import 'package:flutter/material.dart';
import '../services/local_logger.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Symptom Input')),
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
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Describe your symptoms',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Semantics(
                    button: true,
                    label: 'Voice input button',
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.mic),
                      label: Text('Voice Input'),
                      style: ElevatedButton.styleFrom(minimumSize: Size(140, 48)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Semantics(
                    button: true,
                    label: 'Add photo button',
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.photo_camera),
                      label: Text('Add Photo'),
                      style: ElevatedButton.styleFrom(minimumSize: Size(140, 48)),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Semantics(
                button: true,
                label: 'Assess button',
                child: ElevatedButton(
                  onPressed: () async {
                    // Simulate input error (stub)
                    final hasInputError = false; // Set to true to test
                    if (hasInputError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your symptoms before proceeding.')),
                      );
                      await LocalLogger.logError('Input error: symptoms missing');
                      return;
                    }
                    Navigator.pushNamed(context, '/triage');
                  },
                  child: Text('Assess'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 56),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
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
