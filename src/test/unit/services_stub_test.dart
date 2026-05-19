import 'package:flutter_test/flutter_test.dart';
import 'package:b1_medical_triage/services/voice_input_stub.dart';
import 'package:b1_medical_triage/services/photo_input_stub.dart';
import 'package:b1_medical_triage/services/model_integration_stub.dart';

void main() {
  test('VoiceInputService returns empty string', () async {
    final service = VoiceInputService();
    expect(await service.recordAndTranscribe(), '');
  });

  test('PhotoInputService returns empty string', () async {
    final service = PhotoInputService();
    expect(await service.pickPhoto(), '');
  });

  test('ModelIntegrationService returns empty map', () async {
    final service = ModelIntegrationService();
    expect(await service.runTriageModel(text: 'test'), {});
  });
}
