import 'package:flutter/material.dart';
import '../models/triage_session.dart';
import '../services/triage_history_service.dart';
import 'session_detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TriageHistoryService _historyService = TriageHistoryService();
  String? _urgencyFilter;

  @override
  Widget build(BuildContext context) {
    final sessions = _historyService.search(urgency: _urgencyFilter);
    return Scaffold(
      appBar: AppBar(title: Text('Triage History')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text('Filter:'),
                SizedBox(width: 8),
                DropdownButton<String?>(
                  value: _urgencyFilter,
                  hint: Text('Urgency'),
                  items: [null, 'green', 'yellow', 'red']
                      .map((u) => DropdownMenuItem(
                            value: u,
                            child: Text(u == null ? 'All' : u.capitalize()),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => _urgencyFilter = val),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: sessions.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final session = sessions[index];
                return ListTile(
                  title: Text('Session #${session.id}'),
                  subtitle: Text('Urgency: ${session.urgency} | ${session.timestamp}'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SessionDetailScreen(session: session),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension StringCasing on String {
  String capitalize() => this.length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;
}
