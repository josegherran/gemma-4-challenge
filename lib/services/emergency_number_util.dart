import 'dart:ui' as ui;

class EmergencyNumberUtil {
  static const Map<String, String> _emergencyNumbers = {
    'US': '911',
    'CA': '911',
    'GB': '999',
    'UK': '999',
    'FR': '112',
    'DE': '112',
    'ES': '112',
    'IT': '112',
    'EU': '112',
    'AU': '000',
    'NZ': '111',
    'IN': '112',
    // Add more as needed
  };

  static String getEmergencyNumber() {
    final locale = ui.window.locale;
    final countryCode = locale.countryCode?.toUpperCase() ?? 'US';
    return _emergencyNumbers[countryCode] ?? '112';
  }
}
