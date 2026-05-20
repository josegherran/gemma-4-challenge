import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/triage_session.dart';
import '../services/pdf_export_service.dart';
import '../services/local_logger.dart';

class SessionDetailScreen extends StatefulWidget {
  final TriageSession session;
  const SessionDetailScreen({required this.session, Key? key}) : super(key: key);

  @override
  State<SessionDetailScreen> createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  Future<String> _exportPdf(BuildContext context) async {
    try {
      final pdfService = PdfExportService();
      final path = await pdfService.exportSessionToPdf(widget.session);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF exported: $path')),
      );
      return path;
    } catch (e, stack) {
      await LocalLogger.logError('Failed to export PDF', e, stack);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to export PDF. Please try again.')),
      );
      return '';
    }
  }

  Future<void> _sharePdf(BuildContext context) async {
    try {
      final path = await _exportPdf(context);
      if (path.isEmpty) return;
      // TODO: Integrate with share_plus or similar package for real sharing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Share PDF: $path (stub)')),
      );
    } catch (e, stack) {
      await LocalLogger.logError('Failed to share PDF', e, stack);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to share PDF. Please try again.')),
      );
    }
  }

  void _triggerHaptic(String urgency) {
    if (urgency == 'red') {
      HapticFeedback.heavyImpact();
    } else if (urgency == 'yellow') {
      HapticFeedback.mediumImpact();
    } else {
      HapticFeedback.selectionClick();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _triggerHaptic(widget.session.urgency));
  }

  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    return Scaffold(
      appBar: AppBar(title: Text('Session Details')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: [200msession.timestamp[0m'),
            Text('Urgency: [200msession.urgency[0m'),
            SizedBox(height: 16),
            Text('Symptoms:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(session.symptoms),
            SizedBox(height: 16),
            Text('Possible Conditions:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...session.possibleConditions.map((c) => Text('- $c')),
            SizedBox(height: 16),
            Text('Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...session.actions.map((a) => Text('- $a')),
            SizedBox(height: 16),
            Text('Warnings:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...session.warnings.map((w) => Text('- $w')),
            if (session.imagePath != null) ...[
              SizedBox(height: 16),
              Text('Photo:', style: TextStyle(fontWeight: FontWeight.bold)),
              Image.asset(session.imagePath!),
            ],
            SizedBox(height: 24),
            Text(
              'This is not a medical diagnosis. If in doubt, seek professional care.',
              style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic, fontSize: 16),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _exportPdf(context),
                    icon: Icon(Icons.picture_as_pdf),
                    label: Text('Export PDF'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _sharePdf(context),
                    icon: Icon(Icons.share),
                    label: Text('Share'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
