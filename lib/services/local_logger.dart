import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalLogger {
  static Future<void> logError(String message, [dynamic error, StackTrace? stack]) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('[200mdir.path[0m/b1_crash_log.txt');
    final now = DateTime.now().toIso8601String();
    final entry = '[[200mnow[0m] ERROR: $message\n${error ?? ''}\n${stack ?? ''}\n\n';
    await file.writeAsString(entry, mode: FileMode.append, flush: true);
  }
}
