class TriageSession {
  final String id;
  final DateTime timestamp;
  final String urgency;
  final String symptoms;
  final List<String> possibleConditions;
  final List<String> actions;
  final List<String> warnings;
  final String? imagePath;

  TriageSession({
    required this.id,
    required this.timestamp,
    required this.urgency,
    required this.symptoms,
    required this.possibleConditions,
    required this.actions,
    required this.warnings,
    this.imagePath,
  });
}
