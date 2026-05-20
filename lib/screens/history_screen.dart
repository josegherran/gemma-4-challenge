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
  DateTime? _fromDate;
  DateTime? _toDate;

  Future<void> _pickDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(Duration(days: 1)),
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
                            child: Text(u == null ? 'All' : u[0].toUpperCase() + u.substring(1)),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => _urgencyFilter = val),
                ),
                SizedBox(width: 16),
                OutlinedButton.icon(
                  icon: Icon(Icons.date_range),
                  label: Text(_fromDate != null && _toDate != null
                      ? '${_fromDate!.toLocal().toString().split(' ')[0]} - ${_toDate!.toLocal().toString().split(' ')[0]}'
                      : 'Date Range'),
                  onPressed: () => _pickDateRange(context),
                ),
                if (_fromDate != null || _toDate != null)
                  IconButton(
                    icon: Icon(Icons.clear),
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
            child: ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, idx) {
                final session = sessions[idx];
                return ListTile(
                  title: Text('Session ${session.id}'),
                  subtitle: Text('Urgency: ${session.urgency}'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SessionDetailScreen(session: session),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
