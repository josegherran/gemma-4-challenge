import 'package:flutter/material.dart';

class EmergencyResourcesScreen extends StatelessWidget {
  const EmergencyResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('emergencyResources'))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.tr('emergencyResources'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 16),
            Text(context.tr('emergencyMsg')),
            const SizedBox(height: 16),
            Text(context.tr('mentalHealth')),
            Text(context.tr('poisonControl')),
            // Add more resources as needed
            const SizedBox(height: 24),
            Text(context.tr('disclaimer')),
          ],
        ),
      ),
    );
  }
}
