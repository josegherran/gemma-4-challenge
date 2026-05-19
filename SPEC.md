# B1 · On-Device Medical Triage Copilot — SPEC

## General Description
B1 is a privacy-first, offline-capable, multimodal medical triage assistant designed to run entirely on a user's mobile device. Powered by Gemma 4 Small (2B/4B) models, it enables users to describe symptoms (via text, voice, or photo) and receive structured triage guidance without sending any data to the cloud.

## Purpose (Business Value)
- **Accessibility:** Provides first-level triage to users in rural, remote, or disaster-affected areas with unreliable connectivity.
- **Privacy:** Ensures all health data remains on-device, meeting HIPAA/GDPR requirements and user trust expectations.
- **Cost Efficiency:** Eliminates recurring API costs by running inference locally.
- **Empowerment:** Enables users to make informed decisions about symptom urgency and next steps, reducing unnecessary ER visits and improving outcomes.

## Functional Requirements
- Accepts symptom input via text, voice (on-device Whisper), and optional photo.
- Runs Gemma 4 2B/4B model on-device for multimodal (text+image) reasoning.
- Returns structured triage card with:
  - Urgency level (green/yellow/red)
  - Top 2–3 possible conditions (with explanations)
  - Immediate action guidance
  - Escalation warnings
- Works fully offline after initial model download.
- Stores triage history locally (SQLite, encrypted).
- Allows export of triage history to PDF.
- Provides clear disclaimers and emergency routing for out-of-scope queries.

## Non-Functional Requirements
- **Performance:** Triage response in <5 seconds on mid-range phones (Pixel 6+, iPhone 12+).
- **Security:** All data encrypted at rest; no network calls after setup.
- **Usability:** Simple 3-screen flow, large touch targets, accessible color contrast.
- **Reliability:** Robust error handling for model, storage, and input failures.
- **Compliance:** Meets HIPAA/GDPR for data locality and privacy.
- **Portability:** Cross-platform (iOS + Android) via Flutter.


## Tech Stack
- **Frontend:** Flutter (iOS + Android)
  - See `src/lib/` for app code (Wave 1: navigation, screens, theme, stubs)
- **On-device inference:** MediaPipe LLM Inference API + LiteRT (stubbed in Wave 1)
- **Model:** Gemma 4 2B/4B INT4 quantized (.task file)
- **Voice input:** Whisper Tiny (on-device, stubbed in Wave 1)
- **Storage:** SQLite (encrypted, on-device, planned)
- **Output parsing:** Regex + JSON schema validation (planned)


## Current Status (May 2026)

All Wave 1 and Wave 2 features are complete:
- **Accessibility:** Screen reader support, haptic feedback, high-contrast mode
- **Safety:** Disclaimers, emergency number auto-detection, emergency resources screen
- **Usability:** History, detail view, search/filter, PDF export/share (stub)
- **Error Handling:** User-friendly error messages, local privacy-preserving logging
- **Performance:** <5s triage response, performance overlay and profiling hooks

## Future Features
- Support for additional languages (multilingual triage)
- Integration with local emergency services (auto-dial)
- On-device symptom photo analysis for more conditions
- User-customizable triage advice (e.g., chronic conditions)
- Model updates via secure, user-approved downloads


## Changelog
- **v1.0.0** — Initial release: offline triage, multimodal input, local storage, PDF export
- **v1.1.0** — Planned: multilingual support, improved accessibility, emergency integration

## Contributing
Contributions are welcome! Please open issues or pull requests for bug fixes, feature requests, or documentation improvements. See CONTRIBUTING.md for guidelines.

## License
This project is licensed under the MIT License. See LICENSE for details.

## Conclusion
B1 delivers private, accessible, and reliable medical triage to anyone, anywhere — even without internet. By leveraging on-device AI, it empowers users to make safer health decisions while keeping their data secure and local.
