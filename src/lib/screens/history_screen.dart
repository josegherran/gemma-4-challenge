import 'package:flutter/material.dart';
import '../models/triage_session.dart';
import '../services/triage_history_service.dart';
import 'session_detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

  final TriageHistoryService _historyService = TriageHistoryService();
  String? _urgencyFilter;
  DateTime? _fromDate;
  DateTime? _toDate;

  Future<void> _pickDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      initialDateRange: _fromDate != null && _toDate != null
          ? DateTimeRange(start: _fromDate!, end: _toDate!)
          : null,
    );
    if (picked != null) {
      setState(() {
        _fromDate = picked.start;
        _toDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessions = _historyService.search(
      urgency: _urgencyFilter,
      from: _fromDate,
      to: _toDate,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Triage History')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Text('Filter:'),
                const SizedBox(width: 8),
                DropdownButton<String?>(
                  value: _urgencyFilter,
                  hint: const Text('Urgency'),
                  items: [null, 'green', 'yellow', 'red']
                      .map((u) => DropdownMenuItem(
                            value: u,
                            child: Text(u == null ? 'All' : u.capitalize()),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => _urgencyFilter = val),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.date_range),
                  label: Text(_fromDate != null && _toDate != null
                      ? '${_fromDate!.toLocal().toString().split(' ')[0]} - ${_toDate!.toLocal().toString().split(' ')[0]}'
                      : 'Date Range'),
                  onPressed: () => _pickDateRange(context),
                ),
                if (_fromDate != null || _toDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    tooltip: 'Clear date filter',
                    onPressed: () => setState(() {
                      _fromDate = null;
                      _toDate = null;
                    }),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: sessions.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final session = sessions[index];
                return ListTile(
                  title: Text('Session #${session.id}'),
                  subtitle: Text('Urgency: ${session.urgency} | ${session.timestamp}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Disclaimer: This is not a medical diagnosis. If in doubt, seek professional care.',
              style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

extension StringCasing on String {
  String capitalize() => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
}
