import '../models/triage_session.dart';

class TriageHistoryService {
  // In-memory placeholder for triage sessions
  final List<TriageSession> _sessions = [];

  List<TriageSession> getSessions() => List.unmodifiable(_sessions);

  void addSession(TriageSession session) {
    _sessions.add(session);
  }

  TriageSession? getSessionById(String id) {
    return _sessions.firstWhere((s) => s.id == id, orElse: () => null);
  }

  List<TriageSession> search({String? urgency, DateTime? from, DateTime? to}) {
    return _sessions.where((s) {
      final matchesUrgency = urgency == null || s.urgency == urgency;
      final matchesFrom = from == null || s.timestamp.isAfter(from);
      final matchesTo = to == null || s.timestamp.isBefore(to);
      return matchesUrgency && matchesFrom && matchesTo;
    }).toList();
  }
}
