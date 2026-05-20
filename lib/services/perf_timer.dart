import 'dart:developer';
import 'dart:async';

class PerfTimer {
  static Future<T> time<T>(String label, Future<T> Function() fn) async {
    final start = DateTime.now();
    final result = await fn();
    final elapsed = DateTime.now().difference(start);
    log('[PERF] $label: ${elapsed.inMilliseconds} ms');
    return result;
  }
}
